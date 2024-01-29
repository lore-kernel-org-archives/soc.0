Return-Path: <SRS0=bS9p=JH=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAF2C47DB3
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 18:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62D73C43399; Mon, 29 Jan 2024 18:58:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7A77C433F1;
	Mon, 29 Jan 2024 18:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7A77C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706554699; x=1738090699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ch06nTcYc7s7BDv13zY6ZFLhFBoG0R9gezse2mcm2o=;
  b=XDhUi7GsLcs7YIRWMPxW0MKqF+g8g6SQhsYTyeYpcqytw3adGQe2QbIa
   X3tdO/YBbWfCmk5usfI04kyGpCr992d6fja62PTQL26YfAd2KmIeqaG4+
   zrJXKn0bbDsoLJoSNL25zoO7T8JrnoQULdT2m/bh/IGLSk8hZh3centw9
   y/IlT7OvUvw2HVch2aNVB2ifhEXH6BLZexIk1TfYn5dAS6HrK3fXjaKQq
   7Jz3UClbGYovfUmLeKbkk5o08ECE7OXm8Fbrhb4s+50BLIRsOkpFogom8
   gni3YPcKtWOTbNsa6S+bZOVr/bcJBWKI+K6fNhRD+Gyyc4STOgDNZNGz0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16590289"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="16590289"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911172916"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="911172916"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Jan 2024 10:58:08 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUWpa-0004ZQ-16;
	Mon, 29 Jan 2024 18:58:06 +0000
Date: Tue, 30 Jan 2024 02:58:01 +0800
From: kernel test robot <lkp@intel.com>
List-Id: <soc.lore.kernel.org>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
	vgupta@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	guoren@kernel.org, monstr@monstr.eu, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, dinguyen@kernel.org, chenhuacai@kernel.org,
	tsbogend@alpha.franken.de, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	mpe@ellerman.id.au, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	chris@zankel.net, jcmvbkbc@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 30/46] of: reserved_mem: Add code to use unflattened DT
 for reserved_mem nodes
Message-ID: <202401300258.xkXVxP8C-lkp@intel.com>
References: <20240126235425.12233-31-quic_obabatun@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126235425.12233-31-quic_obabatun@quicinc.com>

Hi Oreoluwa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core vgupta-arc/for-curr powerpc/next powerpc/fixes jcmvbkbc-xtensa/xtensa-for-next linus/master v6.8-rc2 next-20240129]
[cannot apply to vgupta-arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oreoluwa-Babatunde/of-reserved_mem-Change-the-order-that-reserved_mem-regions-are-stored/20240127-081735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240126235425.12233-31-quic_obabatun%40quicinc.com
patch subject: [PATCH 30/46] of: reserved_mem: Add code to use unflattened DT for reserved_mem nodes
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240130/202401300258.xkXVxP8C-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300258.xkXVxP8C-lkp@intel.com/

smatch warnings:
drivers/of/of_reserved_mem.c:111 dt_scan_reserved_mem_reg_nodes() warn: unsigned 'node' is never less than zero.

vim +/node +111 drivers/of/of_reserved_mem.c

    98	
    99	/*
   100	 * Save the reserved_mem reg nodes in the reserved_mem array
   101	 */
   102	static void __init dt_scan_reserved_mem_reg_nodes(void)
   103	{
   104		int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
   105		struct device_node *node, *child;
   106		phys_addr_t base, size;
   107		const __be32 *prop;
   108		int len;
   109	
   110		node = of_find_node_by_path("/reserved-memory");
 > 111		if (node < 0) {
   112			pr_err("Reserved memory: Did not find reserved-memory node\n");
   113			return;
   114		}
   115	
   116		for_each_child_of_node(node, child) {
   117			const char *uname;
   118			struct reserved_mem *rmem;
   119	
   120			if (!of_device_is_available(child))
   121				continue;
   122	
   123			prop = of_get_property(child, "reg", &len);
   124			if (!prop) {
   125				rmem = of_reserved_mem_lookup(child);
   126				if (rmem)
   127					rmem->dev_node = child;
   128				continue;
   129			}
   130	
   131			uname = of_node_full_name(child);
   132			if (len && len % t_len != 0) {
   133				pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
   134				       uname);
   135				continue;
   136			}
   137	
   138			base = dt_mem_next_cell(dt_root_addr_cells, &prop);
   139			size = dt_mem_next_cell(dt_root_size_cells, &prop);
   140	
   141			if (size)
   142				fdt_reserved_mem_save_node(child, uname, base, size);
   143		}
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
