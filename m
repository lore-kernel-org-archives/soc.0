Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B05C4167B
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 00:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C664C43470; Wed, 30 Nov 2022 00:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45784C433D7
	for <soc@kernel.org>; Wed, 30 Nov 2022 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669769958;
	bh=hitHTZy+DYECwX6t/IUe+Yg1uyBFdFrqVdRknsATz/o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WcZEMom8zE8XR9Spe9a8nr/CARbSX2ZqVu15TDckBRG38CYe8dOh2jWcLl9dGYvZL
	 8HzFlz9s8JB4+hQ+lImsPPtmtZz9arJyfAu3FfL6zreYsYl9YwW5mNCkRulOzseYXj
	 bsBwMB4f9jbnUsgEFVhTXZ/VksORpwCSPWOB2Mm3simmN+uhc/o3VJtE+HWYL3yCBW
	 d8B0CDukBAKyqKtxKQEJuEtYHooT8BRdEpBNdaDkc/8YwejgTqygURxQKQL1/JLuf5
	 8zTLXextF4FztZPKG1aPxFt2jd6Sp8GpsqhnHggVL2Mx9FUgoRqGmmOgqoubaCAfdC
	 m5ovaKW1rmgRw==
Received: by mail-vs1-f41.google.com with SMTP id d185so15828723vsd.0
        for <soc@kernel.org>; Tue, 29 Nov 2022 16:59:18 -0800 (PST)
X-Gm-Message-State: ANoB5plenAySRs8WsWk/dZWuOYsCYcaULrAgWwtP9sSIGVcYKTgxnF7b
	tQ6UiEPWr/+zTBZx8faJskbafwHotawa7GOVsA==
X-Google-Smtp-Source: AA0mqf5rnHHNGXp4oUSFHP5c4sCgoEsdeGx9NPkxuaM5u/waUw453pq2OFHQtwos2wIwDlU0w3WVgj+snyK+QC2yNds=
X-Received: by 2002:a05:6102:370a:b0:3af:c63c:5536 with SMTP id
 s10-20020a056102370a00b003afc63c5536mr31587054vst.85.1669769957168; Tue, 29
 Nov 2022 16:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20221130003410.191837-1-arinc.unal@arinc9.com>
In-Reply-To: <20221130003410.191837-1-arinc.unal@arinc9.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 29 Nov 2022 18:59:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLv97rHZcbnzGmw0T4pS5nMHVHDjzK54PtVaZzJQh4Yiw@mail.gmail.com>
Message-ID: <CAL_JsqLv97rHZcbnzGmw0T4pS5nMHVHDjzK54PtVaZzJQh4Yiw@mail.gmail.com>
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 6:34 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Hello folks,
>
> With this patch series, we're completely getting rid of 'label =3D "cpu";=
'
> which is not used by the DSA dt-binding at all.
>
> I've been meaning to submit this for a few months. Find the relevant
> conversation here:
> https://lore.kernel.org/netdev/20220913155408.GA3802998-robh@kernel.org/
>
> Can we directly apply this series?

No, you have to send to a public maillist. Use get_maintainers.pl.

Each of these can be sent individually because it is all different
trees. Patch 1 goes to netdev tree. Powerpc and MIPS maintainers will
take patches 5 and 4. SoC maintainers are just patches 2 and 3.

Rob
