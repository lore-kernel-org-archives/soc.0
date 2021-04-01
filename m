Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE91C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:24:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73A35610D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73A35610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JEfNDAI65bkOs1/7EJV6EjOWPr7GG47R/cI7eagbSiw=; b=Gem8SNmI4uoquSSWru50qFO/6
	UEYO3luFfUilJIjjYwqyUlpnPVUD/HUmq3BPeaHyP30Ij49k6ecUFJaEKWDrcvdLjV5r5EpjICJ+5
	wkj/WAyZkyOptA9ACe0l+tsIIWnG98apPCvtjwBlFuR3VheXDaSX6B65QnHgpesh7eAuaU8LaM2yE
	gMMCcoG/tEyK+RAAZIiZYROjcUyNXJlsD3t/pm+KYU8be+DLSyWuD3zLThm1lLP+of9+Gg3T4oBEi
	ql4hth1I6mITfa0VdOGdCqiYPr3iukNs/iFHsXBGgs91CXsnCKEGPKI44kUYOw/Q1+S3be/ob7Wk5
	jK+aqpYaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3pY-00AvG3-4l; Thu, 01 Apr 2021 20:22:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jY-00At8G-Rc
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE6D9610D1;
 Thu,  1 Apr 2021 20:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308163;
 bh=mhCU1T8JgDN9u6ta7ZW4fCGuy6eAATlLzv7vMIfsVYs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gXT6XL6QTLbRZR6CMzTy1KJIMOgfVGEVLZg2zdTwtNPKYLqBGpLYA2wld/UVSSN2J
 Wqq7wGYoDoiLOyaNRPsNdTgf7j4ZXFCYiTakbUgU8yOaZnyY8zfK/h5UBoc5nQRPJz
 gJ25PAVQiVttfswIXv1jfCfovZdY+Yo69V9avEwQTgM6tlO9UkhHYk24K6r3LSjSwE
 RW6PoYs+FO/8Ec2rDrmWBDODLgPJeeDTPIw6v9b39lWmbQ9beEyxVodpmlkBMAlYM3
 k/07YZTjrtEJg56CYx8DZ96AVMkwPSPeRjAX/yZKtwp7LSewVk41lnPjs/IpaqFe9X
 rl+umC3L1y4Ow==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 4/5] ARM: tegra: Device tree changes for v5.13-rc1
Date: Thu,  1 Apr 2021 22:15:28 +0200
Message-ID: <161730808681.655497.5868198720723763066.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-4-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-4-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211610_241921_BF7A0380 
X-CRM114-Status: UNSURE (   6.46  )
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
Message-ID: <20210401201528.zKiH61_wa1zh3Ql0MAiJ5ahWPPevtWzLZYWB3ogKTKw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:21 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 815bacb522c5d5e833dad5be349c80de9afdf1df

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
