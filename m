Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B43C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C1D61477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C1D61477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E80GGaAmvFaAqN5hWC+cr1L1XH3bCjlhfyXmWvr9B0M=; b=1ygOu1cis1l4Xhn0iW002PwdN
	0F07yUuYLglHQ41cyQwcrw4JES7uM6twVko1eSv4KK+NJTeKtH0YsDMK/Ki31VEN6DGLN70mqPaTe
	9wTfxP17hT5w/ppgOJnbwf5qD9Qw06UYZ9ON35V8OEFaoK8T8sh/5L6YhTUKc1CmMRdOMPE6WWVBK
	sxW00eXOmQGGDBqccXRn4ZMEdEl+uvDlU96Nm7+/gr2niePSCzPamfcFe3bExoDp5IQgKffhBuxAq
	YKXg3oodi584EJtvB+jF0ThYkJtulKGjAyiPrEPDISDrHEzUWDcbpWbka1PAkW4ZfZHrPnJzUkQ9N
	d1eULyRBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5ZWH-00026Z-Jq; Fri, 29 Jan 2021 19:33:25 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ZW2-00022O-Fo
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 19:33:13 +0000
Received: by mail-qk1-x732.google.com with SMTP id a19so9892869qka.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 29 Jan 2021 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqVdY6Y1Pq6EnP728WEfCslQJrqbbJH/OzjLm3CcFak=;
 b=frlSKUglNEaK6Zpvp86GtgN++a9yOZ+2aO/YgJHiBy5G2bESsrJHWyNI2fyjx3vG8k
 36MAdBp+4c7E3fDNpL0vQtOPHajP3DYI7sJw4kH4iPjWTWkKPGr1HW2IeE/3NUUQPLnr
 mhr8CQvXb/jEl5SVirY4jZrvGzz7ussoXU9QYtuGzAjXsUjRs2258+JRMYJ+7sqdOnp2
 iQR8/b9kimu0cg4uqhZa9/KTqXm/16i96G7ea7be05PasQqDomlBcbcju9uk6ChGgXZu
 ZOE/XO4pzNNdazf3bFB5grzxkAYj3mD6CDwGkirWuwdcwkBcTuqkhvdObrFVw1sUt4oN
 UpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqVdY6Y1Pq6EnP728WEfCslQJrqbbJH/OzjLm3CcFak=;
 b=qFYhYPjkrDfyi/BWoBX8ofcvaIMNDEWIIgljQ8QguuM4fFfZOZ7iLpXtwcSkuafuWg
 OlPoQihJV3YDkmKwaAwenCW1t46gKHzpPtVbay0Sn9eWdS9zrSWlxL9Y6H8eNWIEUgBB
 TJN4MUxw5mu4hICxFj46pP1GT7Su2O5LFvbICFxB2UtLOxAMUa57oYulrGUwSCXn7jbY
 kA+1NWklPdZdd+fyAQY0evKajCAdvo4jcUF5vKRQALd9G6OLFcIx1Z/N7HbjfnfjqRD+
 XbrpHB8HFFn9H+YLvZKwjhtR8BO7bfg1E4Cgt0/c4Ni7+BtRONJITvC/5eoEocTfrjCs
 HOVg==
X-Gm-Message-State: AOAM533rJdUdoX/u7DC30sHoYf//elgNUkqWAoCn0q0is/VDTmelI48U
 ZGk7hFXkX0GCNCdtxVwrI2I=
X-Google-Smtp-Source: ABdhPJyNcVv2s6OfH0LXqQSxzBg0bM2teWMMrnalWOh+8lH382eWJR2cTxp36jtmwKB0alXh5vStVg==
X-Received: by 2002:a37:a70c:: with SMTP id q12mr5811740qke.25.1611948788759; 
 Fri, 29 Jan 2021 11:33:08 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id h25sm6766744qkh.133.2021.01.29.11.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:33:07 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 4/6] ARM: tegra: Default configuration changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:52 +0100
Message-ID: <20210129193254.3610492-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_143310_578784_BFCC1A8E 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129193252.OLc5jMQ27aUrGsNKVokfe17sNmt93Cr5gl2jOp-F8Co@z>

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-defconfig

for you to fetch changes up to 760f9c2b84106fd02de701c964e7989c9802791b:

  ARM: config: Enable Tegra SoC Thermal driver (2021-01-19 16:54:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.12-rc1

Enables the Tegra SoC thermal driver on 32-bit platforms such as
Tegra124.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: config: Enable Tegra SoC Thermal driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
