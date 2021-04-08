Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B55EC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF5861108
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF5861108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kxx0lnNNp+70XFjEX82J0DO2a2upaUoFm0A9j1tT87Q=; b=QXbDGgYDDsyEW208QKh1qF4sD
	fPiemqn5HZGNveVr52NWvYDYQF+2SuO1FXPJAcsSvPhgbCnb3URO8WM8A86hazCY/4yQj3kroQNrR
	SbQrU97iVPkFsKbyqD/ZgbUGEh96AiqpZQfiYckr4/WzAJYwVUfk3eMdto/7wntEW6+XlbLeciCIu
	Tbgj2H13OOUwV/StQK6XY58cnv+UGvSODuaKJmwcs6opVd0VIVKmi4HMQ3e80SIflejUspoVwotJT
	j/6A4vqOmAF2Xg/OUn8E3I1snqlncWn2c+91Isnr2bD2US6n5Q7V0Pl7hoxSJAoSwFYTQkiwLVBQ3
	Lxcbf3kYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWY4-008NsU-AG; Thu, 08 Apr 2021 15:26:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWn-008NRj-Ue
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:25:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDCE06113A;
 Thu,  8 Apr 2021 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895504;
 bh=W//QrQinB9RvLIs6Kngjx44pLwCSh+McEfUidGVwTtc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DbRUEBpQmHzPKSvfDZxLZRsVNCPiSXo6XI5YaPA9UlwEx4zTl/edeuzDuu1epkvJm
 BnbkXl98bKL7fihIWQDIz12/TfK9X5CnPhSU9EmWvlp6U5Ol12P/YW0ZRDSOqJQULs
 iAQCJ+1mTsl8ifGa8W3PgVlZS5T7XrKbps6nz08Nuafpm1j7xF+kGwTmsWsHM7hqIp
 VpnkVMKlSLQE3uf3GluOOEgWhkGy9pw/3Na8R6w+QUSF8MYVa9SGTnfS0J55gHhWHg
 LgllSGm2cZvtMoSlmorkM5km0dJFdC1f7m4WE3atnRmcZI02k3C35u5E60wOaeCraz
 v770WphRvbOBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: Re: [GIT PULL 2/3]
Date: Thu,  8 Apr 2021 17:24:28 +0200
Message-ID: <161789493801.1630479.6840938905799812191.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617703816-65652@atomide.com-2>
References: <pull-1617703816-65652@atomide.com>
 <pull-1617703816-65652@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162506_457870_17D2FCF4 
X-CRM114-Status: UNSURE (   6.27  )
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
Message-ID: <20210408152428.Wq3xWcU0GOvTOGr4ho1xjpUJg29u5GkxvLs0stHYQps@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 13:10:59 +0300, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dt-v2-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 36de77e35f3bc0fed0f1999f9c5731513be89a45

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
