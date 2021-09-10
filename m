Return-Path: <SRS0=1+dv=OA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22470C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3BA66101A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3BA66101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Imlo7RpbINL9vghTBN+za0EqCQZ0llNycv6XhPaKk9o=; b=qdQhxluM9GDYpc
	yRnQO1KPs7lLp0CAVQKH9rMdQA/m0xwqCYmNfWv7EkNJYgf9QjYWBfr15ZDvrloCW4yojPhFKzf+v
	SSg4237nPLuXfELgJf64nB5UqIP2Iq1J7gwMDkSssTh76uWGOagmMuUaAYbOzJeESfh9mjTlhDNKX
	5CuC/S66/7JG6NA82VZMANoLUPRfQMKhnaehcSNxc4edAvCBfwDR0M8xOmqDipG83vwUT3ztjDFB1
	OzzjHIga9P/wSZYMlbTsZzvqJKEKZjkteLLOAVtumIZXf6tUItXrx9nFVQtZs7zHWIA8SPDQIpSBT
	PGJdLeRyAnoBLbOzhZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOloU-00DVQZ-4n; Fri, 10 Sep 2021 19:03:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOloP-00DVNm-5g
 for linux-arm-kernel@lists.infradead.org; Fri, 10 Sep 2021 19:03:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id v10so4013810wrd.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HzZynKdGrV44/xOe+zaSu5/JFHGIIV4Z7i2+Mxb4So=;
 b=PXcww5kI0R813yeiWBw2wE4F/LSk9naoPzC626Wd5/POsg2wsFYMcT//IXfTy19CQI
 Gha1nqoD/VHFDpvh0jeItrnd9P6z7CcCDWD9xnT/2YKZEWsIrX8IhYcmhgJVLnNa3/Fj
 OeDJFxaV/gxkzivmzrYbRVWWz57oMllNVY/8+Qw3yBK43FVePed6xV2aeSynZawpFRER
 cDkljf2NbfKPw/Ov+cPc751QgEvaJ+x1K28Z0ZeaSl5EfngyvN17c7bzAT53coI3BNUT
 r0f2pKV5ssHkDXTIpRAZik9SfNsIy2n7QcWN03UqXL4MNKkKXnOsKC8YPxGLkOKEh2Us
 O5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HzZynKdGrV44/xOe+zaSu5/JFHGIIV4Z7i2+Mxb4So=;
 b=REKQRUmdjl/nMnCXhn/pNDogcSO3XgpyKPuEn05mldKrhEHu4degp0BB68mtwT8JW2
 NodeBOc3nP3eWr4cfn6rUWkkAjZAxIPhKtG8ZYiQIU+oV104M21UUIZQMEWEWl/QR6tV
 dUrmvGdCKXPGcwPNjO5+EA8MIv0r1P1bI9VlbqsCJhKuCTjQkH0OM+VKsWRJ/hZpoBZd
 ogfSKczuiaOTGpjDnq00lmW5fY0NxiLED5m9Hw9M623SaX5/S7nJ3EoIYu9vffHcBRMx
 RNqn7qkhP5mpy6jKInGJPtMzf//lFxQxfe0eH7/eIurhSKB2WQwB2DybUCT7u+a9yFPm
 eRaA==
X-Gm-Message-State: AOAM533JLXIptcru9lJSXQaQMCcd1AkFBWdWsWZzV4CTZPr5dbyLz1fo
 7z++s6T0wnEdenz2+09MRtk=
X-Google-Smtp-Source: ABdhPJzSGwRdaLj6Q0psVF7VMzyjHnXUukEu7xXHgUWoXVMnooA6oL29OqEyljYzK6eEpDeRL8ebYQ==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr11558258wrb.329.1631300622777; 
 Fri, 10 Sep 2021 12:03:42 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
 by smtp.gmail.com with ESMTPSA id e8sm156734wrj.48.2021.09.10.12.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:03:41 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>, Romain Perier <romain.perier@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for IDO-SBC2D06-V1B-22W
Date: Fri, 10 Sep 2021 21:03:18 +0200
Message-ID: <20210910190322.27058-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_120345_294731_2C432BD7 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210910190318.LiBVdGxNtTh1STWT7X-D6-ycVsuAIw2eGokZ2mGkwHQ@z>

IDO-SOM2D01 is an ultra-small SOM module based on SigmaStar SSD201/SSD202
SoC (ARM Cortex A7 core). The module integrates WIFI, NAND and PM
circuits on a PCB area of 2.95CM x 2.95CM. The SoC integrates 128 MB of
DDR3 on-chip.

IDO-SBC2D06-V1B-22W is an dual-ethernet SBC powered by a IDO-SOM2D01,
that embeds a MicroSD card slot, 4-lane MIPI DSI connector for 4-inch
RGB565 display or 7-inch RGB888 display, Dual 10/100M Ethernet ports,
and more.

This series adds support for this SOM and this boards.

Romain Perier (4):
  ARM: mstar: Mark timer with arm,cpu-registers-not-fw-configured
  ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
  dt-bindings: add vendor prefix for Wireless Tag
  MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers

 .../devicetree/bindings/arm/mstar/mstar.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/Makefile                    |  1 +
 ...star-infinity2m-ssd201-som2d01-common.dtsi | 21 ++++++++++++++
 ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 23 +++++++++++++++
 ...ity2m-ssd202d-wirelesstag-ido-som2d01.dtsi | 28 +++++++++++++++++++
 arch/arm/boot/dts/mstar-v7.dtsi               |  1 +
 8 files changed, 79 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi

-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
