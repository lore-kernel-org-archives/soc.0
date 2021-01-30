Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B708C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB30D64E09
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB30D64E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rvfve+aYAI1dZMWEw87qJKKUh23+ycyDW+501C8Z6/o=; b=LRpaP4lomsmIuiQB/Sm49yeBI
	IJP6vsNCXOTpIp+euGUFRKeQJ392c6+AjgLRYotQnYEBV6RPmHRz3oGo2NuAG8Fwfr0wgETQGQZRW
	n+sFJRtKBRFfqa3CE31Iwr4ULt61LzOPd+BS5of8QUfkfUswK1RedHonh7KHjiNo7L+ViXwbOiLD/
	4d7tq8qQruP8gCQiS3Kz3ISRhoYcCFpSy+WQvwX/NSrpNs3q5LRrMticbjwgPkhsjworYxPozEAiG
	N3V6RWpbwcUUf2vn182hSNgrpH56VLrJJXHokxCKzKJ1+PRTLlUZ63UjLAzzTWaSBcfORW7PQr1Ql
	RShTUOhxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oWe-0001WB-9M; Sat, 30 Jan 2021 11:34:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWK-0001PO-Ri
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD22664E04;
 Sat, 30 Jan 2021 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006468;
 bh=d8GcrjGDLIwrGWLphhWZs9SU7wZ1m4dEn+3+Vn4+5yo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OvXEvTuMyhIWSg2gB8+xRttkph8DEHfL0nz4jm0E3SwDKczLvw2TIqTdOQKGR1C8D
 VR4qTrrnPDPIHVTcDMbPcmO8dTINF3m1LfQTwgnUjd+YGvzvRZK14wuQcOgD4Ex0Y0
 UQhpJuVZ9dkZtI4KIId/nNEyADOoMFtYNdy4Qv9PVeCvbDBoAtkwuqzcnBduyKcqL1
 mZc835QGLLlKqbLMYQr1IQfDr74RfPj+n/GBnjqljxLerFIodGLoVS9T6sZKmbMqSz
 XZRw9pYRIGU5sq1v19rWvjRfFtIENKlfrVYkIp0qh5JryN4I1FbpBVHcQM71rggopm
 1eo60qRV3+3Uw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org
Subject: Re: [GIT PULL 3/6] ARM: tegra: Device tree changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:34:12 +0100
Message-ID: <161200641711.2316427.8570821957670465504.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-3-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
 <20210129193254.3610492-3-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063429_016529_6A302434 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113412.dqWO1-b22EecQJJLMEKx2P_eefRCaVedqM0kxFzv9Tg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:51 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7b76b46d07e0eb754e9517717227595637dc4a46

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
