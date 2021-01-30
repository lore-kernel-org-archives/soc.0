Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F1BC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74C664DDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74C664DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v1zkRPJjLs46oi2ViuLngULkctZl5c+a9LPTG6gH8ig=; b=O3KtnqaTBZHpBduf5zJX7bJI7
	ANd6k+VlYzEDtp/ljxpFuBkOrWKIi2EtHblHzQsewEuprogMhDBRZfjqQe1IpZPlN1/hFDUAo8vkE
	305XJ6uCMG7foSUtTo44uHBgpMAVVelT5eEraaq6RVqvQeLCcYbZhH+le4cS+CG0atWBNOmIjPV8G
	6P1eqLS3Bx4cN86ERQ5SBk5F+R+M8wjbx2/UaVcvxOABXXTbopbyqNFt7Knw8+zR+7i3uGa/NTu5B
	cZMNdBSlUul15Zk3FParXZhzUmecmJ0QAu7p2XyN/L3tD35nzhdzmWljqFIyeOztz698l+57geWA6
	REj+hKxmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oOl-0007CI-OZ; Sat, 30 Jan 2021 11:26:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oOe-0007Ai-22
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:26:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1973D64E0A;
 Sat, 30 Jan 2021 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612005991;
 bh=mOmeB4tPT9hhBNqlsMvRo2GOSWwEIsv3ihHCaa9+WRw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aiXw8hjxtAqoDsQ6d1LQeLZFhKvq/3HdDHWl8Uj256WoFN0/v4kvXJqNPuIneHxEi
 g05+ZD6eAZ4o9IE4gYnyugB5zlhF0OKzknQFPEt5gtx9w/4PKAwPYpIewWDR8PGRxX
 2CCGQRDYs0N7zf3ZZTtoFaScAac9lHZCLCabyf2V+vZHonCE/UovvlTbweOYtpekMO
 akxo8mE25k1UW3PVat5zfQHzuFSIaqsmGsGUfOh5WwOrdph3M4QWdaaNeckX7WStid
 +bQTeOSbfOtSwD0603LE6G0GrvTz43URpoSfbOohGBOSYmVsKoOXMWwnxCPLpT05Yy
 p6Alm6gr75s+Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 6/6] arm64: tegra: Default configuration changes for
 v5.12-rc1
Date: Sat, 30 Jan 2021 12:26:25 +0100
Message-ID: <161200598073.2029918.576266600186123573.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-6-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
 <20210129193254.3610492-6-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062632_192059_D107DBF3 
X-CRM114-Status: UNSURE (   8.81  )
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
Message-ID: <20210130112625.Wyy-j9D1japRE3QS4_Veoc-jmqi8bPrjcZu4mmxOIgM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:54 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: ee29b84a1dfecc32925037871ed18d9af61529b4

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
