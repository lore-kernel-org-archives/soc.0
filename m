Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53EDC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:38:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B1C233CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B1C233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=agcalGA0yiKci9/daxQtuwxmo6XLnzj8PADkMwdSfDg=; b=HYonfzgNL96HqQfdF4aB3+jHw
	rpc7jiPGISGwPL0WAHJtAs/NWwtPIzLTdjMKfHRXlFEyZSLixL3n6YwXGDBKvdwMGwHLUkRGk0s84
	20fNiE5Z165aPGSMwm8/Sl8qf9XOjy30di1Jzzu5/8pBt9cQ8dgoUcqWl6j8ZzBJ7iA/WTDLRmYIk
	prnKPwQjtDDboZhXjubcOhYUdQ0uNMkNiByNIRt5+UIEUMel9IsnP7UUe0EURNIMShp3gKcqOGr52
	1p9Vre06MUpfnSfD5kPvLjn4pEI/qZmObdEo5N58JWs6sjEwTKvMMQV4AGrfCfEweBA6N0DjPWMEv
	ZpjmUb8yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfyx-0001uj-22; Tue, 08 Dec 2020 16:36:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfxZ-0001Pa-MG
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:35:32 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	soc@kernel.org
Subject: Re: [GIT PULL] Allwinner arm Defconfig Changes for 5.11
Date: Tue,  8 Dec 2020 17:34:53 +0100
Message-ID: <160744514011.359082.5475905621967584578.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <dffb8a7e-27ea-4025-868a-caa5868eb1ef.lettre@localhost>
References: <dffb8a7e-27ea-4025-868a-caa5868eb1ef.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113529_859327_A62496A4 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208163453.fVxPFFTpbHzdpb0uAGv2bQUf2xfC4--7xn7g4Nto9NE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 12:23:20 +0100, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 11de454b4cac7ac92e93d3e3853c7ab8ad00a2c9

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
