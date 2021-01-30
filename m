Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C1AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D331764DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D331764DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5IqG6PNRv+pIH8ju5sJB9OXU5Mkk1zwbCD2emHyYT2w=; b=t+925/2UPi0jHn1gP5D2fZdNI
	B6fNVZRR+431oYtV1oXiZ6m4S6ZoS5gPvq3Dx6n6DY18DoPu1oFdzcI4Ki/PSObJmSovInO+OE/w3
	ymzajn2d86ZNnm5V4Si0+e3QRdRspoS13gkVi3HbscNXc5fv+Tf3J/KpEOHkhL9Za3+KxjyoMY36i
	kpVCC7gOV0dkhN4yOemg/W5swnfZNBQIaoYBv3IPxwQHL0Qx6Xz/ZVUWDzPg1nGXwfLL82MAxOsbN
	GDGtHdg1v+xBoCFw9gyWk7Pa94k/JPXizGISUq1IejUQgif/E8FkdpfOShSVm55KAT+kznuvBwrpY
	BEh763+8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oR3-0007i0-Dl; Sat, 30 Jan 2021 11:29:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oQn-0007ax-VQ
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:28:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF16964E09;
 Sat, 30 Jan 2021 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006125;
 bh=dVSnVda4MT9l96Cx6OEnwOmVlVkDiQdI9Xi2xdw1u6o=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DykrBR99H03dSBh96CY6FDgz8DalZdJwI+2J4Q/QEJ7PoJdRtW0UTe3Z5XFkbKUUn
 eql8CSv9XFyiw0HlCWrFg/JPtE7q86oph0oXmp/xds0sMkblbAEjvacT7L4KF7VzNK
 O0IiSmnqmM/JV205Z6aMZ/zJQOuoMs5ct4v4BKplLm1278lmAA99cRztnoiDj6HHab
 sWbHglrgAJfC4u2MMwHmV02ukN0JJTuob3nb8S05fEE7rLmzIQzlC3KjxGmKYdV8kX
 1WkX7UTvbAgVG+twEhLE6eTedlBSHw8GHwqgKE5V/pH2MOG760LQLZtEgP+tZnLnNG
 yNJqk9dmmczRA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL 1/6] ARM: tegra: Core changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:28:35 +0100
Message-ID: <161200610135.2091874.10659158425980310396.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062846_492429_55E0EBB4 
X-CRM114-Status: GOOD (  10.00  )
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
Message-ID: <20210130112835.ttCGFYDH7FflGLZ2Z5GZA8hCdI7e0oVO1DqEvjO68jQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:49 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-core
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 127523504fe89d0c060fa6e2b93b564d0216eb22

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
