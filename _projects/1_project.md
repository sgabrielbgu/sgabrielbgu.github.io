---
layout: page
title: Networking for AI
description: In-network computing and network-level optimization of parallelism strategies for distributed machine learning.
importance: 1
related_publications: true
---

A growing line of my work studies how to design networking mechanisms tailored to the needs of AI workloads. This includes leveraging programmable network elements to perform computation inside the network itself, rather than only at the endpoints ({% cite segal2022constrained %}, {% cite segal2021soar %}, {% cite segal2024soar %}), as well as optimizing the network-level parallelism strategies used in distributed machine learning training. This raises new combinatorial optimization problems: how to place and schedule in-network computation, and how to coordinate communication between training workers, so as to minimize network utilization and congestion subject to bounded resources, while providing provable performance guarantees.
