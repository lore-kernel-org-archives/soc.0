Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23926C43381
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9AC64E29
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9AC64E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o9xrfRJ6WMdeMlSv5DdcDcFa+vXbrOEkO4P+xgEtB8M=; b=t7ke4cD+cgX55d1q9wJSIh2V9
	JtEsOHC6D1GxO2ny24zB7sdqV3zke+pYDNM174LxXSFPtmShLiTZW22W1cj1Fdqgzdgl+P7QdpLKv
	WviYTZAdPlwMvpdqEL1jrosfrscGoeVXTFQusgv+B2kvNOOPkVPs3aE99J+ewZTgBW1fOfq7FsC92
	TpizfcVATETanG+JJIco1Ib+YK4kNUE8SY1eGYjt5AQ8EmOHRoHY1gtQ0phnaWEPfD1sI51x/Y0fx
	hoEPJTthVGg/gkHej6/+eWSE4K5aZ5D0dHyAD018oTcn/XRVi0gp3zmZRhFsS6/PyCX/eOhMJx2+Y
	J3h4Ggrpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L2z-0000yn-49; Sun, 31 Jan 2021 22:18:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2m-0000vr-8n
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:09 +0000
Received: by mail-pf1-x42d.google.com with SMTP id e19so10300823pfh.6
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/T4k3lHLOO0wbkrdlTk7LJ/Zq3cU4QuNjq3JxsvSkzI=;
 b=vKhTi+vt9kmaVJxEWqdDljyxw1IDyGAWPjig29O4Mtmq5ZW8PoXkvv9XY4dnQvgdg1
 WuAc6h+2PPxjCY1JleSHB22sUVO516wS8ALsjlnwaG5bgmDGO3ji1VVIU7ZW+Zy1rL+k
 mHIU8WosjPPfvY5ya8E8/bmGEuHAHsJ+lB95cMKO8PdH/CDahfX9AxVGccYjpUqTKqFu
 0gfP80iecVHZSTSR/W8ARwB8KG/DQoCw0pZDrU2pSSk+u8CtTXe5kPw4cV5+W6qeb1Mb
 4q3amRIVmjK3Q1cToVaq/lKzn9EnbvMG9gC/NCJoT2EQ8aiojwoy/kog65uNiE+f12qm
 qn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/T4k3lHLOO0wbkrdlTk7LJ/Zq3cU4QuNjq3JxsvSkzI=;
 b=roWHejwZ5qp2b4sL+KU6dcVG6UYx9JLPjTkhqK0c8gpWC8ZHlAPR7e652EZXh6WrH6
 2TPoiCo78g2w11jQRnbfgRWUNZfj7xf0CM3/iJgZZ3ZWxRi+1HwkFvfWaQb7Ghpkq7YY
 w6jl0MPARd6+aA4o1ym+jBY7QeV+X88lcLQTe3vAaT/34MFdCnofTJMUJ08zS1PaaUCQ
 p0qBRCeAZVdksg667XM0ge1onMhZaW4kgRHCKACNIOU8LIi+WSlJYNChNtkOrQgykIRt
 o342iEDHBLs6iZyFjX8EDPZYQnFX+QuZp8dE7Du+If8pbaYvTlooq8xw8d/cKbhBTnBa
 9eBQ==
X-Gm-Message-State: AOAM533ScThLFT+DT1r49GFP/lopiIXU9iUi3vctnx11TzeeApmFzZ1t
 9HEtjbUI5stlCcQazzUOnWg=
X-Google-Smtp-Source: ABdhPJw7X+KfMsWTD+sT71vXZQHMKegPfX4Vw1H8la5IOlD7h3laKVPBBYkNHxx83qcSRxD/HyYJgA==
X-Received: by 2002:aa7:8b0f:0:b029:1c0:e782:ba29 with SMTP id
 f15-20020aa78b0f0000b02901c0e782ba29mr13246799pfd.37.1612131486122; 
 Sun, 31 Jan 2021 14:18:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 3/6] Broadcom devicetree changes for 5.12
Date: Sun, 31 Jan 2021 14:17:17 -0800
Message-ID: <20210131221721.685974-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171808_336514_DADFA14E 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, khilman@kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 olof@lixom.net, Stanislav Jakubek <stano.jakubek@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221717.H0rwxhLlwqMLAcegDzSALgH3IkTh1sO51R3zvDetBLE@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree

for you to fetch changes up to a0610b409fc9f90b4861c021ebe853bfcc310bb3:

  Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next (2021-01-28 20:11:44 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.12, please pull the following:

- Dave adds a proper compatile string for the DSI1 panel on 2711
  (Raspberry Pi 4) to permit adequate driver differentiation

- Nicolas declares reserved memory regions filed by the Rasbperry Pi
  bootloader to indicate the running system configuration

- Maxime declares the BSC (HDMI I2C controller) and CEC interrupt
  controllers

- Stanislav fixes a tab vs. space issue in the BCM21664 DTS

----------------------------------------------------------------
Dave Stevenson (1):
      ARM: dts: bcm2711: Use compatible string for BCM2711 DSI1

Florian Fainelli (2):
      Merge tag 'tags/bcm2835-dt-next-2021-01-25' into devicetree/next
      Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next

Maxime Ripard (2):
      ARM: dts: bcm2711: Add the BSC interrupt controller
      ARM: dts: bcm2711: Add the CEC interrupt controller

Nicolas Saenz Julienne (1):
      ARM: dts: bcm2711: Add reserved memory template to hold firmware configuration

Stanislav Jakubek (1):
      ARM: dts: bcm21664: Replace spaces with a tab

 arch/arm/boot/dts/bcm21664.dtsi       |  2 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
