Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A247DC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA68238EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DA68238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4A2vluiXmltdO2KEFmaIBM3CGpxzvhlLv1Lsx0EX9eY=; b=GNsqdyUfFfQSPytMg1rBPhUSH
	IH+23hDmf7O0DEr3/+vFdvqO3kEMaBc4exVKUU+A9aNKD7CttBwmEfdS/2s0k5Gv0aqIbl8Fp8dds
	95zdSyS7U8oFLxK7+OAyDC7s5JKf8wF8glPI6xSMejbpRNZV5KIAXyHGL+58IVoJPa1x377dFGKfv
	vaBSQlGvtGaGdHTydrdS3Td0jcvhFLpYRCaaNZtLs3Yytiy8vaeZ/+G4T/Ua1J7hzD4a97wbaHxUl
	fgjJKc6e7FYu9DrhUpM8G+gZph+C7r5k9uQIAXDgarVad3MuImRkw/RVLcI14G9sziTo6HaRDHJ93
	PpUrfA29g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmd7-0004w5-HD; Tue, 08 Dec 2020 23:42:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmd4-0004vO-MH
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:42:47 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.10, Take 3
Date: Wed,  9 Dec 2020 00:42:40 +0100
Message-ID: <160747095310.4097848.5073060870110923550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <2a351c9c-470f-4c5e-ba37-80065ae0586d.lettre@localhost>
References: <2a351c9c-470f-4c5e-ba37-80065ae0586d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_184246_818187_B6412672 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208234240.xe0SjFcmnWw8WdSwUE940hp8LK0xLuhtCrf-rTxBhhw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 8 Dec 2020 17:23:32 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a7361b9c4615951f52ffd2b1afa09a1384c7b4e4:
> 
>   ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY (2020-11-24 15:24:28 +0100)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d23e6297176453a247b83b3a476e33d75bf2968a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
