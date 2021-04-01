Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851C9C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:28:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288F8613B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288F8613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jrhzEh/WFLc9GwS34+zRUDe8+MUwK/J7h4sBrovFZnA=; b=e7cwigPwWq7aznUuNouL/5+2H
	/M3wEk4MGHO8l11rKbZKH1ZUQiJ894JLF0S8vJvMhLOB1z7NWPgoRjnFKtvXiD+HoEws9t3XR4Ntu
	zspXzjTKppg3xq3gB2aXnMKbzA4ZOhPYo8ndTaGeldIW6Ic0BrBWBoi8H0sM1JDEJSU5A0iFnazcu
	1JwrxiGEtwiJiunM06Hcef8RQhgL90G1/fq3p++kxzb2eiP2CaA3QRHbi69lbfNrsKM4Fnx2/SSN2
	+Ib5asSAnUC8o/fLaRzkhvdYNDuJOhLn44n4+Nkspi/6mKvYbTrEntJRCYU+3nt1zoMiCPGN/K/Zk
	g8dRtjJTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS15w-00AWBa-HM; Thu, 01 Apr 2021 17:27:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS155-00AVx8-K1
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 17:26:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id bf3so2815454edb.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 01 Apr 2021 10:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFyIg8syNYPFzhmphZGsN0/P5BjL76RGwMywZZQhQ6c=;
 b=nvTC5y589Fz/gj87Pv5YA9OmIoYiI3vwoAOpWITntQYOll/KEaz8X20wO9hoVRcw4E
 chE8IvLnNqOcIC+3TaSeWXe3FXsM7JOmQTtn+/q74qyh73IlvDC2rItOxKi76eRm0R5J
 uczD62U9ZYoncx4VbDAWzo7Bk4XfQn8RSFWfY9wgqXWLytg3h69vztqRHUsgs/UamSEW
 fFeNsREl325yllSCy9MMzuv4eYJXvsikbgegvtSeAnicVNDrSgkyVTBVWTNv3WYmvCQc
 w3ZbV0OzLDnv/enXIqlfLqmfMVvmK+ut14Vq1RL/jnVz2SYCiIvRrrUdBIqpBC74CZYG
 krtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFyIg8syNYPFzhmphZGsN0/P5BjL76RGwMywZZQhQ6c=;
 b=dczVg5GLKFPhTONONZ4sicjUvkoHPgBzZfUOQSU8GurF7gdXvT1IvhzriMAxkhPsjk
 iY0G7W/vS9Zsa69BiIILUuaaEJsElhM7cyvyvNQKrCsKq+h5bE39jb6KChdEiju3MC2k
 cNazOEEhwwWsI/PSjKqQZzJizr+pczvhzp+CyARdGho44SaIWoVgAPps2luSyNFlQOsk
 uEiOWcw9T+HAaiO4CcII4ddi1wqs7AoKPx95xneSb2sHKP/IaSdRkL9FAJWtmfOhuRce
 X3ZIgZ3GgbG9do31kHEWhPA1xbZ+gg5MRfaR63QjEZ1vQgluh7Ug+xFC4nTsOd9OWYS9
 t1RA==
X-Gm-Message-State: AOAM532y49oHLTuwIpNDKVYictW4mkCHI9g4Hdig2X+WQXdZsaDRy1ly
 /Rw53qBceieq34tScb+MkZU=
X-Google-Smtp-Source: ABdhPJzHLEVoJiG2OIvfg61ZJ+n48ibWJdHJA6V35LhUTvqh/mUPrd8q/IsIyh5iDD/AyxbRLrbR3A==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr10816258edp.167.1617297967004; 
 Thu, 01 Apr 2021 10:26:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id hb19sm3045144ejb.11.2021.04.01.10.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 10:26:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Date: Thu,  1 Apr 2021 19:26:22 +0200
Message-ID: <20210401172622.3352990-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_182608_994335_2366F73E 
X-CRM114-Status: GOOD (  12.38  )
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
Message-ID: <20210401172622.wmTiMy42k0seHZDytUn1eG6LM3gAJRuS7tZSlz4mpyk@z>

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt

for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:

  arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-25 14:04:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.12-rc6

This contains a couple of device tree fixes for the v5.12 release cycle.
These are needed for proper audio support on Jetson AGX Xavier, to boot
the Jetson Xavier NX from an SD card and to be able to suspend/resume
the Jetson TX2.

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Set fw_devlink=on for Jetson TX2
      arm64: tegra: Fix mmc0 alias for Jetson Xavier NX

Sameer Pujar (1):
      arm64: tegra: Move clocks from RT5658 endpoint to device node

Thierry Reding (1):
      arm64: tegra: Add unit-address for ACONNECT on Tegra186

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi            | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 3 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi      | 1 -
 7 files changed, 13 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
