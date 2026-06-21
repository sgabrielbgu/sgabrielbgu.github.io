// get the ninja-keys element
const ninja = document.querySelector('ninja-keys');

// add the home and posts menu items
ninja.data = [{
    id: "nav-about",
    title: "about",
    section: "Navigation",
    handler: () => {
      window.location.href = "/";
    },
  },{id: "nav-cv",
          title: "cv",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/cv/";
          },
        },{id: "nav-research",
          title: "research",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/projects/";
          },
        },{id: "nav-students",
          title: "students",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/people/";
          },
        },{id: "nav-publications",
          title: "publications",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/publications/";
          },
        },{id: "nav-teaching",
          title: "teaching",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/teaching/";
          },
        },{id: "nav-service",
          title: "service",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/service/";
          },
        },{id: "news-funded-m-sc-ph-d-postdoc-positions-available-research-positions-are-available-in-areas-related-to-router-architectures-advanced-networking-and-software-defined-networks-additional-positions-are-available-in-areas-related-to-cloud-security-those-interested-are-invited-to-apply-by-email-making-sure-to-include-a-detailed-cv-and-academic-transcripts-ph-d-postdoc-candidates-should-also-include-a-copy-of-their-m-sc-ph-d-thesis-cse-cs-ee-graduates-are-encouraged-to-apply-although-strong-candidates-with-a-different-background-would-also-be-considered-requirements-include-strong-interest-in-research-fast-learning-abilities-as-well-as-strong-analytical-skills-and-programming-skills",
          title: 'Funded M.Sc./Ph.D./PostDoc positions available. Research positions are available in areas related to router...',
          description: "",
          section: "News",},{id: "projects-networking-for-ai",
          title: 'Networking for AI',
          description: "In-network computing and network-level optimization of parallelism strategies for distributed machine learning.",
          section: "Projects",handler: () => {
              window.location.href = "/projects/1_project.html";
            },},{id: "projects-caching",
          title: 'Caching',
          description: "Algorithms and competitive analysis for network caching under limited or imprecise knowledge.",
          section: "Projects",handler: () => {
              window.location.href = "/projects/2_project.html";
            },},{id: "projects-edge-cloud-resource-allocation",
          title: 'Edge-Cloud Resource Allocation',
          description: "Service provisioning, placement, and embedding with provable guarantees in cloud and edge-cloud environments.",
          section: "Projects",handler: () => {
              window.location.href = "/projects/3_project.html";
            },},{id: "projects-cloud-amp-microarchitectural-security",
          title: 'Cloud &amp;amp; Microarchitectural Security',
          description: "Security implications of co-location and resource sharing in virtualized and cloud environments.",
          section: "Projects",handler: () => {
              window.location.href = "/projects/4_project.html";
            },},{id: "projects-buffer-management-amp-scheduling",
          title: 'Buffer Management &amp;amp; Scheduling',
          description: "Competitive analysis of buffer management and scheduling algorithms under limited knowledge and resource constraints.",
          section: "Projects",handler: () => {
              window.location.href = "/projects/buffer_management.html";
            },},{
        id: 'social-scholar',
        title: 'Google Scholar',
        section: 'Socials',
        handler: () => {
          window.open("https://scholar.google.com/citations?user=bTzVvToAAAAJ", "_blank");
        },
      },{
      id: 'light-theme',
      title: 'Change theme to light',
      description: 'Change the theme of the site to Light',
      section: 'Theme',
      handler: () => {
        setThemeSetting("light");
      },
    },
    {
      id: 'dark-theme',
      title: 'Change theme to dark',
      description: 'Change the theme of the site to Dark',
      section: 'Theme',
      handler: () => {
        setThemeSetting("dark");
      },
    },
    {
      id: 'system-theme',
      title: 'Use system default theme',
      description: 'Change the theme of the site to System Default',
      section: 'Theme',
      handler: () => {
        setThemeSetting("system");
      },
    },];
