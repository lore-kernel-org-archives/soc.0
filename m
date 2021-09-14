Return-Path: <SRS0=cUWt=OE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBB6C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Sep 2021 15:04:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B76610A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Sep 2021 15:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46B76610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuAP9jQI9L1hYu9Xpa7I7vJw4mr5Bjtxp4aifqm06Ac=; b=d/rC21O7fh34nS
	phaJTpsPG7OzsqnGcMx2JfsHqS3OpvDX1zG4hknwipI0v4vghJ1eVqXhaUvtb/3WQUqnXoPmlfGyn
	A1UBo4SuZ2IoTS0K/3GcS4PgQ658hgd339RYIztUkTGXripz7N4u5SGcuiiLxiBoBkPJDdjKHtAjh
	Pkskbqay22jXPBZzr3JNw7jrmQYw7hSrQpcWs6zt9oHsb/nJgXkZh2h0w1EH5fxMSJyUYPygeBxWE
	werW53455Eh2h4ydiyzGjE7UtqFbvex23T0ftvL65HX0QG5B/SW0p0l3lumaAvIXoULV6KjsPmLf1
	I4YQ62iMdG/wOhNoiYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ9xB-0067bm-Tm; Tue, 14 Sep 2021 15:02:34 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ9x5-0067aI-V5
 for linux-arm-kernel@lists.infradead.org; Tue, 14 Sep 2021 15:02:31 +0000
Received: by mail-qk1-x736.google.com with SMTP id c10so15115260qko.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 14 Sep 2021 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikRfZznVPSXgOHZwn7JV71/YZkay7rEY3B5GGPhJJ+U=;
 b=biWj6oOhhZxdxpaxbui8CnDRKvz3RAAV0JLgdSoWpp1s6sxukGfPhlHQql85u5sKC+
 eWAsEdfVzc4X63GeAFgSUC37oIZ9Qk7Z0iQ9/YARn8S7JZ9e0PyrsEDNqE9JMHEzHl14
 ZrSwlOi5vSL1nO4tt2CSeAWhK2qu2G34II0M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikRfZznVPSXgOHZwn7JV71/YZkay7rEY3B5GGPhJJ+U=;
 b=AyXiksZovX58DOYewdE436/Ir1tt49FtxNYq72JRKW+yAoXJnMNTdSKaB9FE+trnPY
 sL3DfaIXKqaG532dSdPR7L6ZdJON3Ar4DtdAnmvW4t8oA5u5g5iXrHoruMIMYjtTuEKg
 AWX1CXiym7ZkZmXpNfj6xN6BowfioR4WhV7dPfBEvOCTvctM6hn+N5fdE+CLsrbV3Srp
 z0CWQOzqKD+PzAhdypZc5NmlPikh+jgdVyRjlUrJTMV6mrmhG1EnsTrqrQFSgeEGiKNP
 OvbnfSxDVfoVARJaTLt345BW5IyqQIPc+k2UFOKHE9AqRRBkjSxy1pftr2DRHNf0oAWk
 bgpA==
X-Gm-Message-State: AOAM532OLxDK+kpzfZliqiMwShDA5QD02+/QhPFd2OpTHld2od+gdemD
 72/bmyS+FXnJG1H/Dg0tcbyTx+cDW12YN88IuFJ5sw==
X-Google-Smtp-Source: ABdhPJy5FtjBECS7D5pqnI7V2Px/Rkc9Hc6UzmLi6RECLOhHNEvqX50enNMA3OI7/seaVcoHAcaFc+Ldf77gvG30rUs=
X-Received: by 2002:a37:a905:: with SMTP id s5mr5380057qke.63.1631631745930;
 Tue, 14 Sep 2021 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com>
 <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
 <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
In-Reply-To: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 15 Sep 2021 00:04:44 +0900
Message-ID: <CAFr9PXkipBnVDBOpdYhUD4bYNaL8qybPhGJi7YwSHaCNrPz6rw@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC
 maintainers
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Romain Perier <romain.perier@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_080228_232887_0E40B099 
X-CRM114-Status: GOOD (  22.58  )
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
Message-ID: <20210914150444.KCVx_MJa2Vc8LA3wb1jkWhLtrwkAWTIfN0saCXwQTn4@z>

Hi Arnd,

On Tue, 14 Sept 2021 at 22:54, Arnd Bergmann <arnd@arndb.de> wrote:
> Sounds good to me.
>
> One process issue though: These emails were sent 'cc:soc@kernel.org', so
> they end up in patchwork, but I'm guessing they were not actually meant
> for us to apply from there. I'm happy to take merge these patches (or
> a future version of the series) directly from patchwork if that's what you
> both had in mind, but for clarity please either
>
> a) drop soc@kernel.org from Cc for patches that are meant for review
> and will be part of a pull request.
>
> or
>
> b) put soc@kernel.org in the 'to:' field after they have been reviewed
> and you want them to get merged.

Noted for the future. Until now we haven't done pull requests so
having the patches go into the soc patchwork made sense but from now
on we'll send pull requests when needed to you and Olof for the ARM
specific bits. Which I don't think there will be much aside from dts
stuff.

> Or even better, add an explicit sentence below the '---' line asking
> for the patches to be merged directly into the soc tree when this
> is what you want.

Noted.

> FWIW, I'd suggest merging the MAINTAINERS file change as a
> bugfix for 5.15, it's generally better to do these as early as possible
> to make sure any patches reach all the right people.

That makes sense.
Would it be possible for you to merge that single commit for me?
Seems like that would be easier than me creating a fixes branch for a
single commit, sending you a PR, finding out I still don't actually
know how to do PR properly.. :)
If it's a hassle I'll do the PR though.

Cheers,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
