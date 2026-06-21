---
layout: page
title: Buffer Management & Scheduling
description: Competitive analysis of buffer management and scheduling algorithms under limited knowledge and resource constraints.
importance: 3
related_publications: true
---

This is one of my longest-running research threads: designing and analyzing algorithms for buffer management and scheduling under limited or imprecise knowledge, often with inter-packet dependencies. This includes scheduling with bounded delay ({% cite markovitch2022bounded %}), buffer management for aggregated streaming data ({% cite scalosub2013buffer %}), queueing with limited knowledge ({% cite cohen2018queueing %}), competitive buffer management with packet dependencies ({% cite kesselman2013competitive %}), performance guarantees for multipass network processors ({% cite keslassy2012providing %}), throughput-optimal scheduling with bounded buffers ({% cite kogan2016large %}), rate-vs-buffer-size tradeoffs ({% cite rosen2011rate %}), online time-constrained scheduling ({% cite naor2010online %}), jitter regulation for multiple streams ({% cite hay2009jitter %}), and competitive analysis of buffer policies with SLA commitments ({% cite pattshamir2008competitive %}). Much of this work provides worst-case (competitive ratio) performance guarantees alongside practical evaluation.
