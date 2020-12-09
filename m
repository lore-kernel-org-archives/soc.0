Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F41DC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 14:53:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027A4233EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 14:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027A4233EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TLLe6unZpLs6qfdCeBm2SlHUc7RQvE3vt/QMoeZCv04=; b=qz9bcM0zNA72LGpw0kUJyvZTZT
	2B40Om7kEHFH1eKY9Ifbi/pDkZ7QYKkTfLAg43nWVoNx3Qqa9eWT0rKuePOH3BTpKX1xLL67jrwfO
	V/+RcZm+5MUu4o4M6I7fjItYOwY1qUpCVRpHKFmyaoAAzfkGEVP4aoAVaIjKoc9Z6j5OExKeMMlpl
	Sl9xLP7sgWHY7T4Ha4BnsaTq9NbIKWcvoSV+hjWHysW0A6gQ/JVbgO5T2MlTQU/rrF5mrTK29TxbL
	cOhLlDLa2PK/SSVWJEvY90U3O2UZOluy2QzXWHZrst9TEi+iEis80PQhSrLE4oUhGjaJI4x0Fgl3J
	/Ralu8TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn0oe-0007a4-S5; Wed, 09 Dec 2020 14:51:41 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0ob-0007Zg-RJ
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 14:51:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id ga15so2519299ejb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 06:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=L1IO19qXY1NcTfwwUfbiAFQGNNIV2Z5deXmNuyxW8Ts=;
 b=sw9ocUGOkIKJ9XR4bSBdvkEXzfCpjjvu1Ppn2NuuZJc95S3whPcBdxmGE3E3MZy+DL
 bW0Wbjzq03CR96a45mTtwau6YtlvML0iH9r/xgu/PIEThWNIdXBFDEVeHt7lJnWsOTOI
 Thi1S0HSRRPp4XBNnBNX7xsn9jPQvojWCYa4l8YftysS/rqzPQu6v4cWrK0agUj2hq54
 SsMqktxUJzTHGB4IW2rKOB7udirJSSyh2OtzOhBBQl8GwVosD9SMmUQQmvx6wVk50xZN
 Ty1jodJV36KYChy24CuZF51HRM1CFvMEQk84YYcYp9/S2QXTZ7AwAOFlyidMn1wwZ6Ld
 lcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=L1IO19qXY1NcTfwwUfbiAFQGNNIV2Z5deXmNuyxW8Ts=;
 b=mY3NYur1YOa2CEEsJiY6uBEei7sTxlcO4w5PJZwGWrLZr552tMUVs+o5pMpPgsEgXJ
 PiDGD6bQW7wb86ded+4KUpIWNx+8PUvdtKYUFCxH6n9qirG3KwsaYNzWiehac0Hb86j0
 kTZLXvCgGIK0rnO7K7rclmKLNgA8X7lwsxc8B6dmn3gtJ9sF3rF+M9sW0vQsBUvzXkHu
 L9B9QxuqcKDW39ae0x9tMAfKpcOUCb3Ehn7wePkfTOizs/3CrgV2CZFbgBdfzOBd6b/l
 hSxvqQiwdJ8hIcDdu6CuC3dNlPPs+/RFpamSnJSk6ruG2aY04Ba2QqyJCjLreb+0KD4h
 iEJg==
X-Gm-Message-State: AOAM533teh8CKTT+lq5PayO+nTe10YGZF5Y0jshMYkGj9PER6L//Bajv
 6gGAtHSo5YfwQukeZI9D03RAaw==
X-Google-Smtp-Source: ABdhPJzpH9WM0l02jTMF231K/eO7gRxb+cTiaOY92JaY6vCHVH+p72LFzONnlgJihnkURE0e0+d/rw==
X-Received: by 2002:a17:906:1e0c:: with SMTP id
 g12mr2449404ejj.214.1607525496412; 
 Wed, 09 Dec 2020 06:51:36 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id e14sm1720250ejh.62.2020.12.09.06.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:51:35 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
Message-ID: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
Date: Wed, 9 Dec 2020 15:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_095137_919722_F1FBCEC3 
X-CRM114-Status: GOOD (  14.21  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209145134.NbmmzUst-f-AsHksIoLsntEu8NIyktixl2Tc4uWbydM@z>

Hi,

please pull the following changes to your tree. The tree is based on
zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
Use hash-table for api feature check") which went to v5.10-rc6.

Thanks,
Michal


The following changes since commit acfdd18591eaac25446e976a0c0d190f8b3dbfb1:

  firmware: xilinx: Use hash-table for api feature check (2020-11-24
15:13:54 +0100)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.11

for you to fetch changes up to b8d6b5c241b3dedaa03f845e25412935fef81c6b:

  firmware: xilinx: Properly align function parameter (2020-12-09
15:09:11 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.11

- Small alignments in Xilinx Firmware driver
- Exposing syscon interface for VCU driver

----------------------------------------------------------------
Michael Tretter (4):
      soc: xilinx: vcu: drop useless success message
      dt-bindings: soc: xlnx: extract xlnx, vcu-settings to separate binding
      soc: xilinx: vcu: use vcu-settings syscon registers
      soc: xilinx: vcu: add missing register NUM_CORE

Michal Simek (4):
      firmware: xilinx: Fix kernel-doc warnings
      firmware: xilinx: Remove additional newline
      firmware: xilinx: Add a blank line after function declaration
      firmware: xilinx: Properly align function parameter

Wendy Liang (1):
      firmware: xlnx-zynqmp: fix compilation warning

Zou Wei (1):
      firmware: xilinx: Mark pm_api_features_map with static keyword

 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml |
34 ++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt           |
9 ++-------
 drivers/firmware/xilinx/zynqmp.c                                    |
48 ++++++++++++++++++++++++------------------------
 drivers/soc/xilinx/Kconfig                                          |  1 +
 drivers/soc/xilinx/xlnx_vcu.c                                       |
96
+++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
 include/linux/firmware/xlnx-zynqmp.h                                |
45 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mfd/syscon/xlnx-vcu.h                                 |
39 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 187 insertions(+), 85 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
 create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h
[linux](zynqmp/soc)$

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
