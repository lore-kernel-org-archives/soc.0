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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70FBC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 18:43:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D4623101
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 18:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D4623101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n66corvS3UfVgeXjZmXa1+8MPVjuUzwm/sY8oNUdI6A=; b=zkB0wq+d8ETIWqrfjf7/MarExa
	Bd+fXpjDSxj2qvnTJzW7byclGqEk2ML/beAdGRhY1HlzguuFvMF489KlCSVBwwL8GwA9sSUZVRJKT
	rrK/xtUrbx1TZ48VeebVy59vYCsVPftxNUMCB9RuqKxu9i9xzfkbebO/FaXF/QenQ2AegqHT7tZ+H
	1+wXWd6vcorkWDFeyeP5CKn9d3NgP366Q3uIfc0izcZEXZsWUoX7MMc97/SJWMbMxZ+Kmuutwihmk
	UIakffVS+ud4jSK6IpCYRvaoaWdKC7qEMPCRDyDaWtMnX5JIilKaQB4P8axE+BEKcT54XqMdUXA/Y
	fJzGHN8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn4PX-0007gn-3L; Wed, 09 Dec 2020 18:41:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn4PT-0007g7-QE
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 18:41:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id r5so2677452eda.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=8RqaQ7XgudbyVp4IXxqQ9rHJaYf+ZXQi1yhwiXLgsQU=;
 b=oFTHVDdMXwRmYq73BcpW90ijU0/MVOyUsax/WRs6Le0imND5Y6o8DmgJXHs0djsuDn
 r8GTDEvdmvCpNXiSh31dDbhnItMpFG8vdRz5fjTmn7/reWbkGfIrKyWz+WZ/Pwknkdmz
 AXjPRYrgaEYW/QXC/6r6CW5Tz4dW9QFEBewMD+E8TOG28xSxdhvo8dlTldFP8FWxQPs+
 5y74Rc+NObF2PbbHhHMXtYCO2gJckj4/+pqXFf2cqzWkVvibPhFwQ1l5mlGLufzcXhOu
 7DLqpLUHtBl+cWmJf2/CZ09l1RlLzBAGICVUB61rGOL5l4bu1lbouQyPAsw3wk7txNJo
 sIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=8RqaQ7XgudbyVp4IXxqQ9rHJaYf+ZXQi1yhwiXLgsQU=;
 b=k6dD2+2fsMlEgLTzrKYasOtYBpe0OD6SMNaS4ghmy/Eq7iuvQtT2KCTOo2iUOa/s6Q
 DuZtm84sR3zJJG2WgAJ6P050hcV0M3bShghSHc92GlD6cWsBnhZjsKRmaKSfGEVE5j8c
 Xg5wedYJJQpBTRf2EiNW8CE+R8R1QsEcTlGAeE7ScSU8px1IlmQd6BWOhUsNPjcCXQRd
 nfyEJFujnfTJxp1C3f22PgtB70umF6zm6TI+TpxNQmKRmKGp7poYk6ZXJ5Z7tVzr19G0
 b8CnglZ4JwCKXg7Xwp6Wy8ikkGh5DK/jeFmwprb842v3aWOZNi4dWvvFzrHxUq5PQG3N
 UYFQ==
X-Gm-Message-State: AOAM531Mllom0n7Pz/BKQLnG+TuMXQcj+aKf/AT7K0cJSJeagJzC+SRJ
 YzCJkUh4ATHb5UkM5gn3xYQuCzP4FWDJH691
X-Google-Smtp-Source: ABdhPJwI4IMiHZaFmSAXaw3pk7lHvkM5NUr/SqlnoogKj+onwvXNIwYSn51HAM7l2aEkQs1MEWCGSQ==
X-Received: by 2002:a05:6402:1d9a:: with SMTP id
 dk26mr3314461edb.283.1607539313756; 
 Wed, 09 Dec 2020 10:41:53 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id c11sm2548787edx.38.2020.12.09.10.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:41:53 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP changes for v5.11 v2
Message-ID: <71d38756-4456-29fc-26a3-341e1d09aafe@monstr.eu>
Date: Wed, 9 Dec 2020 19:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_134155_872649_51E087BA 
X-CRM114-Status: GOOD (  14.17  )
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
Message-ID: <20201209184152.tB2ktNcxRALZqCKTZPwCCbtxuDgWz_bsgQijdzK8jkA@z>

Hi,

based on chat with Arnd I am sending v2 pull request which is based on
v5.10-rc2 with dropping one patch which will be queue later.
Arnd wanted to target arm/drivers branch.

Thanks,
Michal

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.11-v2

for you to fetch changes up to 311c2520de21cb2f44291ad3d984b42191126628:

  firmware: xilinx: Properly align function parameter (2020-12-09
19:36:34 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.11 v2

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

 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml |
34 ++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt           |
9 ++-------
 drivers/firmware/xilinx/zynqmp.c                                    |
46 +++++++++++++++++++++++-----------------------
 drivers/soc/xilinx/Kconfig                                          |  1 +
 drivers/soc/xilinx/xlnx_vcu.c                                       |
96
+++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
 include/linux/firmware/xlnx-zynqmp.h                                |
45 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mfd/syscon/xlnx-vcu.h                                 |
39 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 186 insertions(+), 84 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
 create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h


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
