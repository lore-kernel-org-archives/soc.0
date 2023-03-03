Return-Path: <SRS0=PnVM=63=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F102C64EC4
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 17:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B60CC433EF; Fri,  3 Mar 2023 17:12:28 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76420C433D2;
	Fri,  3 Mar 2023 17:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76420C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677863546; x=1709399546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7gT1uRRS/s2rb1jiK2Tpq+ml2NdiLvR0qfU6wXGpI3Q=;
  b=REXKn6HqEWfixAFFNaOOTFkq/FvVcJSOcZyJlbDGM//0IZLSWpE0COFp
   FASHdJEP8F0kX8Y3iaX/GtC93e4y+29c8RS55qUm3Lapg4EaC5ADlROQ6
   04XmHqg7Pp9JNApy4yR4xvsMpYUi62z9Up2YdEm29T2h+RlKpPI47WhWR
   RCaVTWVse5qVTTdM6Wv94Gg+cENqaMd21+345sBpiDKT09klkfg58RIq3
   I78AZdktqZNDsMP2InfHmdHrwRq0Qd607OlOkJdxRpx7bsjcRvWlmTfPV
   6Ugl8nzYJ4UMeUEbxrJmaT42O4JRYl0lBTWNuGMvwaOE+Q7jtCvqHOLQS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="315497299"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="315497299"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 09:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668731759"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="668731759"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 09:12:20 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY8x9-0001ZQ-1k;
	Fri, 03 Mar 2023 17:12:19 +0000
Date: Sat, 4 Mar 2023 01:11:46 +0800
From: kernel test robot <lkp@intel.com>
List-Id: <soc.lore.kernel.org>
To: David Wang <tomato1220@gmail.com>, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	fran.hsu@quantatw.com, David Wang <davidwang@quantatw.com>
Subject: Re: [PATCH 1/7] ARM: dts: nuvoton: Add Quanta GIS BMC Device Tree
Message-ID: <202303040046.YS2c6Prp-lkp@intel.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>

Hi David,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on soc/for-next arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next xilinx-xlnx/master linus/master v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Wang/ARM-dts-nuvoton-Add-Quanta-GSZ-BMC-Device-Tree/20230303-143845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230303063435.803097-1-davidwang%40quantatw.com
patch subject: [PATCH 1/7] ARM: dts: nuvoton: Add Quanta GIS BMC Device Tree
config: arm-randconfig-r046-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040046.YS2c6Prp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/35df7d319f11bec38f67ec9b341d8b9c4d51c028
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Wang/ARM-dts-nuvoton-Add-Quanta-GSZ-BMC-Device-Tree/20230303-143845
        git checkout 35df7d319f11bec38f67ec9b341d8b9c4d51c028
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040046.YS2c6Prp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:204.1-6 Label or path emc0 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:212.1-4 Label or path mc not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:220.1-7 Label or path ohci1 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:224.1-5 Label or path aes not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:228.1-5 Label or path sha not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:232.1-6 Label or path udc5 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:236.1-6 Label or path udc6 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:240.1-6 Label or path udc7 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:244.1-6 Label or path udc8 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:248.1-6 Label or path udc9 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:252.1-9 Label or path pcimbox not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:369.1-5 Label or path otp not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:387.1-10 Label or path lpc_host not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:1059.1-7 Label or path peci0 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
