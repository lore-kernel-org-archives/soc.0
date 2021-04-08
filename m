Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FDEC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:52:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006E261107
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 006E261107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wSkSg7oHrzrbRrDOFW4ectM/KQqQSAmnPvx3Mj97934=; b=O3TEbwFKccsbBtu05iKbOnJGO
	J/shswWlh59CgHEw0yr0lYV3nYD0cj9L/GqdPAB+dhunIKGntlA7sJMFgyLvao0GLuBjY4uIB9eMr
	kAg28iNx5++kXJ/lHfgZHeCZHIBv/TlSajGXLqLgKaS+xtPDomBS4CnOgROC0tcZZW5JQQ6LYXvhD
	gMeD4NLPfwEeqmzIE0AR5fA3nPYDigeH7S3VXFTy++hgKtqBdGPT0Tke7+6j3LGf9r6yln9Co+Wxc
	dETwLU3RTV0QlRFaADCVobrtwt3B58aroKqFXmnQSY9sIvHzLyOpAv37dxddWxFg3S0fteKBHIYRC
	MMJ+4pRBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWvJ-008VJC-Fm; Thu, 08 Apr 2021 15:50:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWup-008V7f-NE
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:49:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CC061158;
 Thu,  8 Apr 2021 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617896994;
 bh=SK63wqZYU3DsXQuWRf8x+2cEIgroaltGmCMLkEJA334=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UbVX0LONVMuHtM0a1Dr4WSfvzdNh7FRvwHQoHHSGIPFUGKQb5n4GXFtCMErzF3t8o
 zVgTG472yQQSduCqCIMU2NDDsx8x3gJo5DByGZh67tW/8wAQ/PWxvSO5kWMplPPcQE
 Y2sypgqjlJZSJrz+0G+riaoO9jaQ0K2NHGnfSzU34EOnK58/Z8jYjo0yKohcmc0mdN
 dwsNGQljNBL6PgGPpZhKK52lYpcNHflQTMce2SCCD5glP2MAhl94zORS9wOJ721Zkv
 TR6f3iB6b/wVcGSyTTCkx3Wsp9X5hsQEpMgEb1qvfPLyqiJ3IeoqZHNPsaG41E1k0u
 bgla666f/isPQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 ARM SoC Team <arm@kernel.org>, ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Kevin Hilman <khilman@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: updates for v5.13
Date: Thu,  8 Apr 2021 17:49:32 +0200
Message-ID: <161789693280.1636044.5523561185670345817.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331100657.ilu63i4swnr3zp4e@bogus>
References: <20210331100657.ilu63i4swnr3zp4e@bogus>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_164956_483171_D464354F 
X-CRM114-Status: UNSURE (   6.94  )
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
Message-ID: <20210408154932.9LGtDrmLpnMYkGDrAx2sD1PUtnNQ-15WsRH91CS2XBc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 11:06:57 +0100, Sudeep Holla wrote:
> Please pull !
> 
> All the drivers files have been acked by respective maintainers.
> There is a conflict with IIO tree in linux-next with right fix there,
> we might get same conflict depending on what gets merged first upstream.
> 
> Regards,
> Sudeep
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4be3f47e1bd5c9be4c4b95de5f3531f062a28a66

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
