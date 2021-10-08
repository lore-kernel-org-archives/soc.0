Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6C7C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6058D61019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6058D61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nT1GkzBIn5mz3jKB02tSIy5SlatgjmwQ4jEw4ny2gag=; b=mGTrQF3h7vxXLl
	SvEOOiCaJB8AiOZ8LRBipKrcD/xAh1qqTJRf/fUHViseKkuWvRqJznmXbTlEL6e1BEJvDfzhyfm7/
	gElxFCGXB1ZtD7qaQ7MkFbSJCTYX3eK6WpQ5NGvks/xeo9PyxjsbELIPijQtEmwtgry1P5c7qkJMr
	nuhLfED51F5EacONqRiWTEG6vHSx/F4tkt9tchLtQbuYPn3oY2fzcn/IYe840eoBX7xDshIMsdi8I
	A07jgXu4XLjnanYTBfqYproRvdOfkZJuBQBunfuhHrhdoX28HI5vstrjQyOg78jbLzWHRmdU3DtMO
	JCIO+R17ACctreREtfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwF7-0043H2-3B; Fri, 08 Oct 2021 20:13:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDc-0042jp-A2
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id m22so33182050wrb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xphg3l2/2x/WeN6+HltLN1eWB+puBlk2ozbyExKcZFM=;
 b=GvEPVBLaebZAGU6y6wfl27wjhrQY674H03hcqjRc88nqrhF5ta/gF/slf+8Ggsi6Of
 p7W78gAE9BeKazhWrzH9fmtws5/okOIXOhYq27y+bbOeOd1KQ9VcrY6OnC2gAiLlzW+n
 VPADnC8ogRuR1wRiIifrQmyMJNr/fJKzsjf22p9eU9+oI/zrPQn+s/36AUlCW6obsuy9
 6QM4ruRGkSxyzNVDnkVkKlYfTjWUHSEVrvHme07h9uIP2iQ25s4yGI9z/O8C4HsvygzC
 YbCsqgS7m1NZ/LAzCAsPruBAZtDxf9ws3NpU1cJciA0UDViO/Awlox9tx7aNyQmQSM9l
 dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xphg3l2/2x/WeN6+HltLN1eWB+puBlk2ozbyExKcZFM=;
 b=lyF+IyWrNbBcczS0n2Be4mCdU5edENMCLUxFtbkdaluOzJZajFbhLRWwOa2buN4sBs
 OHD5aRRbo3ehHCq1qGJ1Z3mZ5b4H4+k67sfc/Z9mTvTgOd2YA6ZNn1B+8H91yK8g8Dj3
 itGjMxuO/k1tMILIrVMeMHBaxJTVhE3EbQ95fVSpdN5OUg2csbIglfSYs+EmQvfw7J5b
 c8Iwm6uZb/k4uXF8zRL7zWJqS5i1ndxBC/QExIAhTgmxAYP2miVM1tqDy70oMBMqEqCJ
 lAuzssNQw2IqD7uc4T8uh/dS7rkwZK6ZuhvsAd3UZ5nFic0do1zVcXyec6GcT3DB1ClS
 Cxgw==
X-Gm-Message-State: AOAM531pUZK/2w6hvpmkUArI2Itb8xVqelOG/wbiKYRVZN/Wmj+4klT/
 KWdxHGfDG3MJWBwBIyVcFmw=
X-Google-Smtp-Source: ABdhPJxxV0u2rfbBJgUD5YOEA79AfteLO1sL511IgyUcJ6P9M2z7Kk/6rwy8SstNn8rY7oCh8uLeYg==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr5911176wmd.20.1633723907149; 
 Fri, 08 Oct 2021 13:11:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id n66sm159972wmn.2.2021.10.08.13.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for
 v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:32 +0200
Message-ID: <20211008201132.1678814-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131148_385749_1970EE61 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211008201132.9aP8GXP0JTQUViofajF6qP6mxN84u8xpg5LYmgL0ays@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-defconfig

for you to fetch changes up to 1e9b81616627643eb1a78c8fe98fc95eae74024d:

  arm64: defconfig: Enable few Tegra210 based AHUB drivers (2021-10-07 20:37:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.16-rc1

This enables drivers for the various audio processors found on Tegra210
and later.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Enable few Tegra210 based AHUB drivers

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
