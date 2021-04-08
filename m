Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FD0C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:18:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9CC36113C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9CC36113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9kxzXbunzbkXjD/GyAlBM+5GHqLSy0UVVaq+oPVmWcw=; b=D1XuYYf6U04WRCxPPMKZUWq+r
	HSZdtN4sWmiKKXg8Gf1n1ZcTh5Xl40d6PAghjnyGMxe51tgnNTbKPbPocwHpXR4ymvlD7mhUHtnZr
	YI5NOjltHDqZeEW7NapWddoF5kzbio/E3FQrlHh7Fnv+SIcoZrXLbQZXi9PC+7bCXyeFcGtXaGsDE
	HaS2qwVHSS1ifqPG+BfBCSNxTcmhpPNS1zKTvo7xXFFwQ5baCQiVopsjIeJeEEL2uw0j7dG/9P/ah
	E4TYpysM5cUUJW9FugTvRmXNZ2bHgXJVhmKGZNUhb3S5scANqRtR+xLSjRER7ADB8zmWbkffDgmB8
	OIAmipkHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUb4X-009BH0-QE; Thu, 08 Apr 2021 20:16:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUb4T-009BFn-53
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:16:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8D461151
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  8 Apr 2021 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912967;
 bh=Vecg9KIUrMwTeNuxTL2SM02Hu9b26BNOPOHh2Q45wrA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=HFPqRs1Wo2bVkTNAdINzjWtFpnw6+YTpGZ0rYHPoMZBnS41pep2MHDMXe/8OGOl3X
 LwK9liIB+YlQuYXSRIFbFdsMoJuTofiadBITXpUiLBBGWLUKcbpdgYPJeHPDc0b+C5
 FV05aqcPIUHM6nM52X4Z5qrFj7UU182jMQtsxlOXnL4rAtxchWFQkM9mSI+0PamVyQ
 nY07luvZcF3tHDOTkqIdDhYBd98XvxtwAt53LcjfLTo2rX9ls36pW1Rmf52zWEHuFz
 76uiHGPOx0Cb+Kr0scHbaEIAlaCJNyg4rN4Hip5VGDls29My3z1bFqoI9tPRP1KcpG
 i7L0cfEqk/5Eg==
Received: by mail-oi1-f171.google.com with SMTP id x2so3499220oiv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 13:16:07 -0700 (PDT)
X-Gm-Message-State: AOAM530vjPx06r7c47Keb/FOu2lanFayWWssOc34bcYWLNmy7PaCaAMe
 x3p/jaCiF08mFe4nNFx8dm/OlMQr0C3ixdEVDc0=
X-Google-Smtp-Source: ABdhPJy9/NcBZP2ckZSF0eIQNMconnpaO2naL6Olb8+ApOOEdJ6ODFyzLr1Ky5rfTyg/l6/bS4lMM2m3U5wV3GUJh1w=
X-Received: by 2002:aca:5945:: with SMTP id n66mr7375236oib.11.1617912967143; 
 Thu, 08 Apr 2021 13:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210407114415.13180-1-nicolas.ferre@microchip.com>
 <161789493817.1630479.5024717274217057698.b4-ty@arndb.de>
 <71b2bd27-0d3b-3331-4f79-85b22594e20b@microchip.com>
In-Reply-To: <71b2bd27-0d3b-3331-4f79-85b22594e20b@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 8 Apr 2021 22:15:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1dyccHquEoSv4kECw-=RKNQAFVQap-DYTX-sDfwEPTGQ@mail.gmail.com>
Message-ID: <CAK8P3a1dyccHquEoSv4kECw-=RKNQAFVQap-DYTX-sDfwEPTGQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.13
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 arm-soc <arm@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linux Kernel list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_211609_390153_24053FB0 
X-CRM114-Status: GOOD (  13.34  )
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
Message-ID: <20210408201551.JAvpZwg_KX6In8BoSFcU_JTWHjOwHwV_Y6N27QMS4j4@z>

On Thu, Apr 8, 2021 at 6:35 PM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 08/04/2021 at 17:24, Arnd Bergmann wrote:
> Oh, got it: it's the upper case letter withing the etm hex address. I
> used this one to mach what was done in the reg property. I'm fixing both
> of them and sending the patch to the ml right now.

Ok

> Tell me if I add it to a subsequent pull-request or if you prefer to
> take it the soonest in order to not generate additional warnings upstream.

I'd like to have it before the merge window, but don't bother making it
an additional pull request if you already plan for another pull request with
5.13 material.

Thanks,

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
