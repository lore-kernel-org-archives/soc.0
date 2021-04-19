Return-Path: <SRS0=+ow/=JQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C747DC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 15:11:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9D961007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 15:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E9D961007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fhWmbGT2XE8efdNQmpbJd3jWSND2bDwCFy+RiZ5k+yU=; b=nZUFEJM9pY5l3ROED4T0rJUOG+
	5PSHWsp+PIUSHp7gRTXvAB/fYOqE3C2vQbdLDK2YONp9Lt6Mdsy7QmGAYeJdbSsQXKgGi/Yy3YYE4
	dLuXoSAmihLzCSo/qpu/E1yiRhtGCCqYSC4NUKF7+GT7lg8CTpaCuqiMKbuyvfzuWQEShCWG7KBlP
	hQrTCkPeGZOOsKv8+I7qdkBNV8OGtaTu9ypxpIqg1/fX0jEUgx5CRiaQREDETInpTd8zKMaDVR00+
	Sj+8znV/3Al7aV1yFXB7jrKmLwPvbz3iCYwZoXmhtK+7tOCmbR+H04szbT7R7I10YC65AyarLDcm7
	bLbHI1Ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVXK-00A9zl-4l; Mon, 19 Apr 2021 15:10:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVXI-00A9za-12
 for linux-arm-kernel@desiato.infradead.org; Mon, 19 Apr 2021 15:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=; b=UJ8Q0q0x5q+FA7iVouJ5jQex5L
 LRTmndwGn1S8TU4BcimeJ9uzUph7xmXabw9H3cQftiKgLsf4JKgfv9aABJn1WR3gxg1sN7+BaEaZt
 PG5Hjh1WRuhMgG+QZcRE3ni9bCLupvWhvRKC6P45MVpUl9bBXkrpLkJlT94wYetMxX228p483zxKS
 iVtnSygN0JyoDxwT8/vD9bsBAn5mna7WhtEP0TOp5oR8yPsuXBYos+gPtVg5YSYw5nmc2dcAbZBhf
 ajAZpbvFPjQkTSL4MG2G8AfD34fkXwFtcmunNDLGFwSe1ZR4gVlp6u9OdZodWtZJzb+WzzVwf9G1s
 NqoCyKBw==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVXC-00BTaa-Mz
 for linux-arm-kernel@lists.infradead.org; Mon, 19 Apr 2021 15:10:02 +0000
Received: by mail-oi1-x22f.google.com with SMTP id n184so9716803oia.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 19 Apr 2021 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=;
 b=lBV3eh4yMGcw0lYrX19B5UryCJpgZc9mYX4RoQ+eV5iLvRUyGWNmkVoEUxVo10/CpU
 RKSpIfB3BW+jTHV0UDGn3AC/AehaoMK+eLufxsbj8qzpIKOjVyUobRYqRMjoNsdTS0RT
 se71ePt3uhsv6htwRrZ88bnCv9AsAEGoUuRekcRctF+hpnG9nAsztGtmEaeKhdwm5uI8
 NdRyPLSWfpHkv0vzth897yblwJZ1URldSaDltK755WW98yLYp92JGLAuX7Ty9xK/qVJ0
 IzB/XwXHm1yE5bmuDaZIlN751yKBRvZAGvY2o29531LpOyNnX6RK4D3FQp1moQa2hBrO
 Nryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=;
 b=noeBWDqumQpEDsAsLpJ3x5a/5034AvL5wxBz7HCsJDoSWu2KKdJ0haLE1Vg3bh6yAq
 LIh68x9Pjj6YhOOPRSGYvji9QjZhjthjN4a3Sl1zlck4ZO9umWdxfFRHVka/RneborGg
 0ewbLR5GDvizq/RTiMuFbyPFqZ0UnlFresnBwGv6WRzc385hV4ijoPfdRK2TI+zhMG20
 aQvjua2hLPIvJjyqKVlxG0ByOLqaX0WkVLgH6Tn+eGd8FTYB81S033g4GD32zmfXCFaj
 coPyUu/s8r+1HK1TIvl/fxQ7S+ugUQX9XZTKsTyFaBb+rpy9WBiITV0n2XPNBrg+1xbZ
 lZrw==
X-Gm-Message-State: AOAM532w/u8IW3VBBXv5jyI0GwOppGMdkJ9uKze5ew+IQBNt9MAvtR5R
 Sat8EXpKbJ5MrhBvBjqY+gqbnA==
X-Google-Smtp-Source: ABdhPJzOvIG9+263Vs7RPSxqh9TNbUCMKdLwV0N+9EFcHrqfJ6XnLxq1gGEaTygCtEX/rfCwxG+TXg==
X-Received: by 2002:a05:6808:f08:: with SMTP id
 m8mr11644084oiw.127.1618844997831; 
 Mon, 19 Apr 2021 08:09:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x13sm3492048otg.57.2021.04.19.08.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:09:57 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@linaro.org>
Subject: [GIT PULL] More Qualcomm DTS updates for 5.13
Date: Mon, 19 Apr 2021 10:09:56 -0500
Message-ID: <20210419150956.860423-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_080958_802060_9CBA5BB1 
X-CRM114-Status: GOOD (  11.97  )
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
Message-ID: <20210419150956.ZZUqdeochRiHlD8OcNDCggVmQ-aHXW3gr_j8u5HWuAE@z>

The following changes since commit 885aae6860fae1eed38f5cc1ac09a40e4896a38c:

  ARM: dts: qcom: msm8974-klte: Add bluetooth support (2021-04-06 11:53:16 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13-2

for you to fetch changes up to 06ad53efeb496d8841169ec0919ba6852c7852f6:

  ARM: dts: qcom: sdx55: add IPA information (2021-04-13 21:35:56 -0500)

----------------------------------------------------------------
More Qualcomm DTS updates for 5.13

This adds CPUfreq, interconnect providers, IPC, remoteproc and IPA to
the SDX55 platform and then adds board files for the Telit FN980 TLB and
Thundercomm TurboX T55.

----------------------------------------------------------------
Alex Elder (1):
      ARM: dts: qcom: sdx55: add IPA information

Manivannan Sadhasivam (14):
      ARM: dts: qcom: sdx55: Add support for A7 PLL clock
      ARM: dts: qcom: sdx55: Add support for APCS block
      ARM: dts: qcom: sdx55: Add CPUFreq support
      ARM: dts: qcom: sdx55: Add modem SMP2P node
      ARM: dts: qcom: sdx55: Add IMEM and PIL info region
      dt-bindings: firmware: scm: Add compatible for SDX55
      ARM: dts: qcom: sdx55: Add SCM node
      ARM: dts: qcom: sdx55: Add interconnect nodes
      ARM: dts: qcom: Fix node name for NAND controller node
      ARM: dts: qcom: sdx55: Add Modem remoteproc node
      dt-bindings: arm: qcom: Add binding for Telit FN980 TLB board
      ARM: dts: qcom: sdx55: Add basic devicetree support for Telit FN980 TLB
      dt-bindings: arm: qcom: Add binding for Thundercomm T55 kit
      ARM: dts: qcom: sdx55: Add basic devicetree support for Thundercomm T55

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts               | 281 ++++++++++++++++++++
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 282 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 207 ++++++++++++++-
 7 files changed, 776 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-t55.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
