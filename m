Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBB0C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:28:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF84B613B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF84B613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sgec/Ub57cvX7l4T3TkQR4QOcWoqKrgPhDh/0tbL3Hw=; b=POOmV7KGt4mcs0lnzxU2MOKZd
	TMInggnzz7d2S25j+37T7afIEdsC7Ne9QkY7//Q807Q8SmW8WocY/Ax6YEvoDOkSyV9h904Grpqg1
	yNd5XShp2Mer62NcqHelxPa8R8ty3GgTh6aHjPU7uwoQJQign6ZHKB1rzXjvTAy2vWo7Hp5Q3wGLw
	BFCqrOEWllA/gwzdqNF3UcHrjleGyg0sWrR4bOM2TQuW9opWLJKG65blhwjxGJZ9KTxdnyi32HlHx
	MtU6RiE/LqJh7130ODyhUlZmq5Yl4ZPE+reH77DkX/xp4wroSKHekk9vJLEdD4NnteKEbhGIvvICO
	Fs7GJqaTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS15g-00AW6u-Ry; Thu, 01 Apr 2021 17:26:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS153-00AVwP-97
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 17:26:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id bx7so2792693edb.12
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 01 Apr 2021 10:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g5sLzzLW3ME8Xe8VqYfMyA7U25GpLo2zuKXzOdcoRKY=;
 b=fMyLwNAl16sg3Najvg/gxxAfWYQYJWo6FFTC5aQ4NfcfFj+7bs47jmjSuh9LRIkX3R
 83Wk/V5NLiYy/SSpUY228BUxI+Cuet5RWYo2CS4HbVnRpNcROxCdqHLnbhO7KmsZ7vMK
 C2vNpBJEy4XDGdLXfF0ytJ4uh1iLXWQ5/MoZGg0Ytl4smHYTjx8rrz5hmj0/4TIBGGh2
 GdexAPTyyywyoZJ6qho1j/h/PBLcOzjZ4NyGAxpPmu6bi2MMDnFntnrnTpgqrV7XSoby
 w+jE4pouiq8y2g82hqYSDpaDjSU1QJ1qc6dmJFJ4+i/tq6aTnMRPCzTw7TK9GXYNaEj+
 LoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5sLzzLW3ME8Xe8VqYfMyA7U25GpLo2zuKXzOdcoRKY=;
 b=A282jtJhMYmC6AfxOJ8OcrPCdgMFMJ8eGC6OqumA/KDCJslvdYA7invx60EtdzkbP1
 aJYcTyqcYZZ7NoNHQmazP13SlFOOcl4qbQhFl2+diyxzlNV1rPqOvm6iS09GXSMZo//9
 jy9OaXexfJSWcR50OPXLb8c16/ncCsxQjGFslcSRQeZd40CQF+fsFk31ljv41h381y4t
 pT2vbt98ul3WWsBlrFfJJ4ASuMFNl+G6zArgfqJsbSr16ZxKCC3I4DbNLhn9H6PlK9PX
 Td30RsX7khcSuJm3aeM0EKQWFFK7ho3JQQ9QaoNScMcy3wtSukNldfCI+3xmbwEhEcg3
 psIQ==
X-Gm-Message-State: AOAM532DoZcIcEziygAmICEQ7c3vP7tHAAnYJ8Oi8Ip7VT8qcZd3ITtg
 qyZcWNPA9eMTw84bmUBfzH8O7ZhdjR4=
X-Google-Smtp-Source: ABdhPJzIO9me1GxZXSNCR7NdpxHXdxcnYyP3uc3QZBz6aEJV0912UIwloUJFSuLMCdCoSAL1UuMEiA==
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr11495614edy.30.1617297964690; 
 Thu, 01 Apr 2021 10:26:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c17sm4377374edw.32.2021.04.01.10.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 10:26:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:21 +0200
Message-ID: <20210401172622.3352990-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_182605_573869_46274D8F 
X-CRM114-Status: GOOD (  11.38  )
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
Message-ID: <20210401172621.2Pj5qCiqe2t6LMgwvbrGfFyJi-ypt6KyEOLDGRSNdDA@z>

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm-dt

for you to fetch changes up to 3a6c267dd7b8822eb722835b503c5a438cbd3700:

  ARM: tegra: acer-a500: Add atmel,wakeup-method property (2021-03-26 14:21:28 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.13-rc1

This contains a couple of improvements and fixes for various 32-bit
Tegra-based boards.

----------------------------------------------------------------
Dmitry Osipenko (15):
      ARM: tegra: ventana: Support CPU and Core voltage scaling
      ARM: tegra: ventana: Support CPU thermal throttling
      ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all board variants
      ARM: tegra: cardhu: Support CPU thermal throttling
      ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core domains
      ARM: tegra: acer-a500: Enable core voltage scaling
      ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
      ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
      ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
      ARM: tegra: nexus7: Specify all CPU cores as cooling devices
      ARM: tegra: ouya: Specify all CPU cores as cooling devices
      ARM: tegra: Specify CPU suspend OPP in device-tree
      ARM: tegra: Specify memory suspend OPP in device-tree
      ARM: tegra: Specify tps65911 as wakeup source
      ARM: tegra: acer-a500: Add atmel,wakeup-method property

 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  5 ++
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 16 +++--
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |  2 +
 arch/arm/boot/dts/tegra20-paz00.dts                | 14 ++--
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  1 +
 arch/arm/boot/dts/tegra20-ventana.dts              | 78 +++++++++++++++++---
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  1 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 14 ++--
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |  1 +
 arch/arm/boot/dts/tegra30-beaver.dts               |  1 +
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           | 48 -------------
 arch/arm/boot/dts/tegra30-cardhu.dtsi              | 84 ++++++++++++++++++++--
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  1 +
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |  3 +
 arch/arm/boot/dts/tegra30-ouya.dts                 | 16 +++--
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  3 +
 16 files changed, 204 insertions(+), 84 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
