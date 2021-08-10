Return-Path: <SRS0=SoTB=NB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F219C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 07:47:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3B060C51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 07:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F3B060C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2kQLb3XtxYsHYTvKax5BaJHrp0RVX9FVmwXdGv8qAw=; b=Wu24z9zBV86P1t
	1oLXhwfQPMX99lc13FYu47Pg/xayg8pX/P0iem67nRbRtQ77juKtODaRBs36lKLTE49I9bsJj6qPS
	wy3A/OyfD6OiekUVT8ImIpfKME8vB7TKrIKGBoHhWOHhoQiUtT8rqrVC6r+zYn3wAK+PzR3sLpqg/
	GRBa8EZxmp1uoRIOi9EAwUma0fTjojQsq/78fkgWymwlJbGAGZtf020CJm8g0vvvaBpj4BM1fMM+j
	vK7T/kkzz6rZyIuJoPCU8Na+w13TOPPNBkEBMwwiB07QVwh/DmLGD7mUmFzZ2Ve9OCtfesWXAY+MC
	Xf64W44QpTb/A9YWJuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMRH-002muT-AZ; Tue, 10 Aug 2021 07:44:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMRB-002msr-SG
 for linux-arm-kernel@lists.infradead.org; Tue, 10 Aug 2021 07:44:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id x12so1479837wrr.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 10 Aug 2021 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=MiCMBWeN2PpiCfpnHSh2SkMrcXWi1PWXVgHWoU9qVss=;
 b=qAHHSc4P4i607lJZ5A0MF2XRZnz6tj9nU8fB96XaHXsJ2npo1mCRoT2BexDAaRnUJO
 TrzZLvs8X0Dknhmw6Mor8bcUQFr8eXkqVosiwzZkaO+FWi/psTOrB97+716tGAUHRvsP
 dzH7PoD3PmCf1oylxYUdGd9opdPSueelQmvxAWZ/zZEa0ql20iKlTrPGcdHMh4VS8KFk
 t+XJEBLMHhKTD98NAlugYzs0Vi8HiSXVBYxGN9pyrNu5EA6IyogYpw4HSz4zICDc7ueB
 JqzFvMmvM9BAiKO0bdp/QJXjO3uEGCHHbfUrJmvBfegawrQEIojdzwaRhV8T7Hr+Fomy
 UmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=MiCMBWeN2PpiCfpnHSh2SkMrcXWi1PWXVgHWoU9qVss=;
 b=sxVpkVImetyhrNILyQ3rvRMjFlxeECTZXCW4+M9MvYkWMWYvp/uA8YZ3uBgmCVor47
 FYpJkuGd8RcScRT2cWRUtVi/EqPJh3qiFbl8lY0BiaT1jh/hsvnP/3j/3j6qJHQR2wzK
 QdPYwc6AloG3hxxFwY0IqiDsqFOuuPIOYGc1BBbQwXzyIp9JWNX8xqb8h2jzE9ajGP15
 /Q5r7a8+ZIj8EWeF5urm8BJU0Ab+BYFOTNS/qJaxOzRB4/XqoiIL6hnDX5Qj2a/r5+QS
 +US9FI7kKXYUp7N/4xQJ3gqT0pHVNIoir0IxW3JGrB7c1cIah6wwoLEc/+rqGQyLOsUp
 Verw==
X-Gm-Message-State: AOAM5339G3JnBjBWBHp89r9qiFn+HiqiDPIU4SZmMXuk3kWJcYBVXSHJ
 Pm64gGKyyQak98wWgf1ygreqxg==
X-Google-Smtp-Source: ABdhPJy0PWFVjxxJf2WgN7HTFJnPxgaYwi+j07qhXCNjIe84rGnHhSifuXv11STOFdZMoJeKO36iNQ==
X-Received: by 2002:adf:dd47:: with SMTP id u7mr11880838wrm.425.1628581475854; 
 Tue, 10 Aug 2021 00:44:35 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id l41sm716352wms.2.2021.08.10.00.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:44:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <032895d9-62b6-6c9e-b04b-9c3d316f27ec@baylibre.com>
Date: Tue, 10 Aug 2021 09:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_004438_004176_2839F680 
X-CRM114-Status: GOOD (  10.75  )
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
Message-ID: <20210810074435.ET8kJN1eyg877_4Y1yLf_dO3-3OJi48l1_alrZi6O_8@z>

Hi,

Here's the ARM64 DT changes for v5.15:
- nanoki-k2: enable bluetooth
- khadas vim & vim2: improve wifi

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.15

for you to fetch changes up to 4b5260032ec691b11a9185f7f38f5761e67fab48:

  arm64: dts: meson: improve gxm-khadas-vim2 wifi (2021-07-26 10:08:16 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.15:
- nanoki-k2: enable bluetooth
- khadas vim & vim2: improve wifi

----------------------------------------------------------------
Artem Lapkin (2):
      arm64: dts: meson: improve gxl-s905x-khadas-vim wifi
      arm64: dts: meson: improve gxm-khadas-vim2 wifi

Chen-Yu Tsai (1):
      arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth

 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 13 ++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      |  3 ++-
 3 files changed, 16 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
