Return-Path: <SRS0=uBN8=OE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6651C433F5
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:26:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 91CD961165; Tue, 14 Sep 2021 15:26:29 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C179861159;
	Tue, 14 Sep 2021 15:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C179861159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqZE0-1nCNF50MQC-00mcVN; Tue, 14 Sep 2021 17:26:27 +0200
Received: by mail-wr1-f44.google.com with SMTP id w29so20101576wra.8;
        Tue, 14 Sep 2021 08:26:27 -0700 (PDT)
X-Gm-Message-State: AOAM532HZaYY7EZ3T32E8bDSYUhm/5Ch+r26jPYQe9shY6Gr7PuhgKSU
	TuSwzh4j+z6w8TLEDwurxUobLb36DAB3PDroKkA=
X-Google-Smtp-Source: ABdhPJx58PLXLbIDPH3agyMnNUczBn+6WHGZgh2cx7ovkyQCQ1tT2E26eQzrosGp+LginhSbFYIKP6merOG8OWf3s2g=
X-Received: by 2002:a5d:528b:: with SMTP id c11mr18953468wrv.369.1631633186700;
 Tue, 14 Sep 2021 08:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com> <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
 <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com> <CAFr9PXkipBnVDBOpdYhUD4bYNaL8qybPhGJi7YwSHaCNrPz6rw@mail.gmail.com>
In-Reply-To: <CAFr9PXkipBnVDBOpdYhUD4bYNaL8qybPhGJi7YwSHaCNrPz6rw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 17:26:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=GTcgbqkwnzsFtBtFZTtf4Lop7U5hsCAid-fCgs07yQ@mail.gmail.com>
Message-ID: <CAK8P3a1=GTcgbqkwnzsFtBtFZTtf4Lop7U5hsCAid-fCgs07yQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Romain Perier <romain.perier@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LIEWIyyXpJS7PKHDhBZ+Rv++qUZSwsTNVmnjWmKJfMYR9/PYM4/
 CBSAAUcBUJWVUI3gfnF12x/YTX5DvGuGEr3jfyFe3aUW8Oq0gXTRodwhGRKocUTReI4t6bj
 1VQc56Fr/jnC2pb4a4+UhKKqGDvRj9egOPGpnArD198iG4fa4GySn/re9KT5unUtfXkw+46
 v8e2ifth4wYNIrsEUiCUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L6LBIrsk4II=:ZSU37vJO/OsFW5H/hBey4F
 nBdS7Z9SmW58Eo75n8U2LiWlqPcF+LA93yJpG9rIJCvQr3NcIc/CwZE+jHlluxzPQz80iLxvC
 +D9y4dgzGr9MwRDKp6eQL5ZWgcn5dlkRNifU/n9Jwve8e3a3i/gJbvARcPDdoRCthaD1ey4gg
 55TeSgVz3RjnbQm0yEFhWyJt3jVYnx2an3E0JMuezlxHmcrduw6+TShVHKKXUj8v9xBv7NzDZ
 YSg9wzp4+Y39Padsfm/QqGFriBOsgP+KfWLG4aU+FlWhDUAFvRM3h/mPDXCFfTSRfClG1D+qP
 6U8BMHecGdJOAtOwqTAaKjyUWc05oABEF6nBLfjyTU3vrcrqHJc7VCvMKYyRueOwgvCE1sMXK
 /j51JC6Z86uN1z1U1xR1S0jRn/4MQp+w515Ud5isub/yhllyOAxu7nAZxH1pxp48RP+1OeDwg
 e9vgRT4ixJZDQRtO1pSjdUaxThc7e2RyXyFlERen4wHSOeWJI/o31hLFa/Ba7haeD/n2pdeGm
 V3VVKYN/6ylnQoTF0hLzosrhtHSKzEKE3GhcvcDMcuDA548r/ylmWX3CYeYlUoUwiZHifIYT6
 o3PMU/J3Fu5yw7ZlqhPQfGF8YVvF4ugsZ8YG7kY++SHYQxsGWcyXBhPZzeecMJF4v3uim6sza
 t+zA76qIQbFjBYDrpV+2MRUgkyZa7q3nuBy/u/3BFPsIHsplNLkzB3n3P3Hr0gE0tDNyR85gf
 QYd7gNXs00ZZlzyPf/Q+x1AQfBta8AKrd77r2A==

On Tue, Sep 14, 2021 at 5:03 PM Daniel Palmer <daniel@0x0f.com> wrote:
> On Tue, 14 Sept 2021 at 22:54, Arnd Bergmann <arnd@arndb.de> wrote:

> > FWIW, I'd suggest merging the MAINTAINERS file change as a
> > bugfix for 5.15, it's generally better to do these as early as possible
> > to make sure any patches reach all the right people.
>
> That makes sense.
> Would it be possible for you to merge that single commit for me?

Done, merged into arm/fixes.

> Seems like that would be easier than me creating a fixes branch for a
> single commit, sending you a PR, finding out I still don't actually
> know how to do PR properly.. :)
> If it's a hassle I'll do the PR though.

If you only have one or two patches, sending that patch to soc@kernel.org
is usually the easiest way anyway, unless there is a reason to keep the
branch description separate from the patch description in the git log.

      Arnd
