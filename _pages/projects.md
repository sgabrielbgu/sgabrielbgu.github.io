---
layout: page
title: research
permalink: /projects/
description:
nav: true
nav_order: 2
---

<div class="publications">
<div id="research-accordion" role="tablist">

<h2 class="bibliography research-topic collapsed" data-toggle="collapse" data-target="#topic-1" aria-expanded="false">
<span class="topic-toggle-icon">▸</span> Networking for AI
</h2>
<div id="topic-1" class="collapse" data-parent="#research-accordion">
<p class="text-muted mb-2"><em>In-network computing and network-level optimization of parallelism strategies for distributed machine learning.</em></p>

A growing line of my work studies how to design networking mechanisms tailored to the needs of AI workloads. This includes leveraging programmable network elements to perform computation inside the network itself, rather than only at the endpoints, as well as optimizing the network-level parallelism strategies used in distributed machine learning training. This raises new combinatorial optimization problems: how to place and schedule in-network computation, and how to coordinate communication between training workers, so as to minimize network utilization and congestion subject to bounded resources, while providing provable performance guarantees.

{% bibliography_theme networking_ai %}
</div>

<h2 class="bibliography research-topic collapsed" data-toggle="collapse" data-target="#topic-2" aria-expanded="false">
<span class="topic-toggle-icon">▸</span> Caching
</h2>
<div id="topic-2" class="collapse" data-parent="#research-accordion">
<p class="text-muted mb-2"><em>Algorithms and competitive analysis for network caching under limited or imprecise knowledge.</em></p>

One of my longest-running research threads: designing and analyzing algorithms for network caching, including LPM caching for forwarding tables, indicator-based caching with bandwidth constraints and false-negative awareness, latency-aware caching with delayed hits, and access strategies under imprecise knowledge. Much of this work provides worst-case (competitive ratio) performance guarantees alongside practical evaluation.

{% bibliography_theme caching %}
</div>

<h2 class="bibliography research-topic collapsed" data-toggle="collapse" data-target="#topic-3" aria-expanded="false">
<span class="topic-toggle-icon">▸</span> Buffer Management & Scheduling
</h2>
<div id="topic-3" class="collapse" data-parent="#research-accordion">
<p class="text-muted mb-2"><em>Competitive analysis of buffer management and scheduling algorithms under limited knowledge and resource constraints.</em></p>

One of my longest-running research threads: designing and analyzing algorithms for buffer management and scheduling under limited or imprecise knowledge, often with inter-packet dependencies. Topics include scheduling with bounded delay, buffer management for aggregated streaming data, queueing with limited knowledge, performance guarantees for multipass network processors, and competitive analysis of buffer policies with SLA commitments. Much of this work provides worst-case (competitive ratio) performance guarantees alongside practical evaluation.

{% bibliography_theme buffer_scheduling %}
</div>

<h2 class="bibliography research-topic collapsed" data-toggle="collapse" data-target="#topic-4" aria-expanded="false">
<span class="topic-toggle-icon">▸</span> Edge-Cloud Resource Allocation
</h2>
<div id="topic-4" class="collapse" data-parent="#research-accordion">
<p class="text-muted mb-2"><em>Service provisioning, placement, and embedding with provable guarantees in cloud and edge-cloud environments.</em></p>

This thread studies resource allocation problems arising in cloud and edge-cloud systems: dynamic service provisioning across the edge-cloud continuum, VM placement with constrained communication overhead, virtual service embedding under time-varying load, and reducing service deployment cost through VNF sharing. The emphasis throughout is on algorithms with provable performance guarantees that remain practical at scale.

{% bibliography_theme edge_cloud %}
</div>

<h2 class="bibliography research-topic collapsed" data-toggle="collapse" data-target="#topic-5" aria-expanded="false">
<span class="topic-toggle-icon">▸</span> Cloud & Microarchitectural Security
</h2>
<div id="topic-5" class="collapse" data-parent="#research-accordion">
<p class="text-muted mb-2"><em>Security implications of co-location and resource sharing in virtualized and cloud environments.</em></p>

More recently, I've been working on cyber security with an emphasis on microarchitectural attacks and virtualized environments, including the security implications of service placement and co-location decisions in shared cloud infrastructure.

{% bibliography_theme security %}
</div>

</div>
</div>

<script>
document.querySelectorAll('.research-topic').forEach(function(el) {
  var target = document.querySelector(el.getAttribute('data-target'));
  if (target) {
    $(target).on('show.bs.collapse', function() {
      el.querySelector('.topic-toggle-icon').textContent = '▾';
    });
    $(target).on('hide.bs.collapse', function() {
      el.querySelector('.topic-toggle-icon').textContent = '▸';
    });
  }
});
</script>
