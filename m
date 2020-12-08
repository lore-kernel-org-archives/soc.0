Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9296EC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A40E23B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A40E23B16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=icJ0Y5RcHJXiv9YNaramQYsyiLW9Hp6hLgyZXAkBRRM=; b=Ss7/8i7kjitDhhaIHBHUdt2sV
	geKiSgkTN2OLCx/saN7aBf7l+12byX4usi876ykbJuQRAzbsRA3FYlnGAvFXlmgsd8083ck48qp91
	0fgFzfkqnZSlHb+9loQaCfkl8E4ImOg7Tqf6/Z0XwEDYysn06Whexgp1cLmJzcKeliGcfuqu0ST0y
	vDOmSFD2NU6BcJKwPmsB+b2vX30RkwTLYtJZtZ1oNzaLdVU0WjH1gwkvggVvJsQS0s4C6zjAVzXAg
	fHrBW78y0qkAdJ6GehAVC1bxyxIkDWhyZDVRObRD67Gks7GPuDETasksNHSPSyAw9Zd2aLpeeL4pg
	3pFKBF9RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm7X-0005Vw-5V; Tue, 08 Dec 2020 23:10:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm7U-0005VH-1D
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:10:08 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Olof Johansson <olof@lixom.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org
Subject: Re: [GIT PULL] ARM: at91: DT for 5.11
Date: Wed,  9 Dec 2020 00:09:34 +0100
Message-ID: <160746884391.2839681.15347071935799467817.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127220403.GA1735041@piout.net>
References: <20201127220403.GA1735041@piout.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181008_161895_5EA852DA 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230934.gdvPO0rrEO2cmpHgCd8ZwrzOf8FwA5eRmZNthrTZjgY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 27 Nov 2020 23:04:03 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> Here are the DT changes for 5.11 which contains non urgent fixes.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8caaf0610fb9948b1f3ad220f83fccfc24e33333

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
