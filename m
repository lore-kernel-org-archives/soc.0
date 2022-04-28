Return-Path: <SRS0=8exe=VG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A1CC433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 20:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 451C5C385AD; Thu, 28 Apr 2022 20:48:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C044EC385A9;
	Thu, 28 Apr 2022 20:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C044EC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmkjY-1oAx2E3Cpq-00jopJ; Thu, 28 Apr 2022 22:48:00 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ec42eae76bso65963367b3.10;
        Thu, 28 Apr 2022 13:48:00 -0700 (PDT)
X-Gm-Message-State: AOAM532zKVUU2imIFPukS3/0cKzkwUwcSsxJz15B1w3vjE+vUpRaGsJL
	7059ul5ciQMuPcrvc+Fl36/+VFc41eCS233wKPU=
X-Google-Smtp-Source: ABdhPJwwrdVTuYv//nRPW9fNDE9Rr8o8BYq06TKXNGJU2kXtWtzvORA/cpH7FQOL1pHoe/faBSaozhss7bne+khipgo=
X-Received: by 2002:a81:1dd1:0:b0:2ea:c38b:65a8 with SMTP id
 d200-20020a811dd1000000b002eac38b65a8mr34417764ywd.135.1651178879470; Thu, 28
 Apr 2022 13:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220427162123.110458-1-maukka@ext.kapsi.fi> <20220427162123.110458-2-maukka@ext.kapsi.fi>
 <CAK8P3a2renoWK+rUYBAyUb10v-TKfv6gLTQUiGFRroFgLCv+9w@mail.gmail.com> <d8ab7986-c0a8-e11f-3599-a09c2938d936@ext.kapsi.fi>
In-Reply-To: <d8ab7986-c0a8-e11f-3599-a09c2938d936@ext.kapsi.fi>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Apr 2022 22:47:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1P0y9rKDbXbUW9GCyGg=4hT+XYPZt3HKoWRGoBiNfKSQ@mail.gmail.com>
Message-ID: <CAK8P3a1P0y9rKDbXbUW9GCyGg=4hT+XYPZt3HKoWRGoBiNfKSQ@mail.gmail.com>
Subject: Re: [RFC RFT PATCH v1 1/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oWAiFrqApGyS+RNoH8GDsZWXwie0C/vMT3GbGrOpuCtqs1cpgcb
 UsD/9T8m3VM/hPXhRbygyXjFOKbxwGzKQqLoFB6Bp44g7jK9ocof7tI/JstP+lHB8OR/siE
 9BbUFlXmmr8ckvkZ9eB4xECKA3buS9OYk3RE/6In85Zk1i3z3Cwav3fIUjHhZ2TUqYgB/Nk
 E+5buqxz+RfKHMieEGbrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hTRl2eh6TiI=:yI+MBqxoPX6vJuazjd45pe
 ZHN3OoS1DiItmMAAJAhwujY2BqZsuYReTj1V60ZCfg/kjrlxpK+qo0VE7UxsAKN9uD0bgWdmg
 dhwmgftkh+CeFWVQjOIO2pnyAXr347ibb+IrE+q6GVviIXUqm7NWUn6igYm8FLRaIJd+3ZCe5
 57W4wt+UbTXlYPzhmCo5vlNo/F7KAJKLqeucPA+U340hdAzVkye8LWHTLAZSHGNfC1ev/fEgK
 KKXKLNeTVasyYwpbF+Fkr7zWxUCb9/GieSQwoGL63CP1NHrjSLzXI5NS74GoBDwodKpQIUMK+
 uLfuAwVHy1/eYouMc9tDLOGnfIpJuFqgjzkCENUsjKBqdAHw2DuU8KSxQM53eTfpviX+jR54e
 2yEVhetjXvscaJxUO6C1i+E1ao1s/CsYm6rcgONdDvTqgbMR3g5HkD5hyx+DbxgILpyc6MOjo
 CJX7FuUH2GTyZwRqiX5CMU8qVfj0dikOzUyG6xwPXe/0ZQJFy7iWe8yNVFmx0hPJDBeQ016oW
 NFgDEgpEQ/Ak5FSRu/YmSS+6Pn8rie5WDD2vls6acvWPkMh/VjEEO4PZm+XihtUcfdCrURMZd
 qnqZ84dmYyJ7CealEyJiH3XRLt40x4q5hztKG9DCis2klAbATWvYI1bIzmAD7IA3f9Ba172Tq
 8xrUPwDTmOSWRL4TdLzJNSSM/jQ6qt8LULDVW+5kx8H4jP/ebnVg0Kf/t9E0n5E5nRz4=

On Thu, Apr 28, 2022 at 10:06 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> You know, I had them initially in separate patches but then I looked at
> the existing commit history and at least a few ones were in a single
> commit so I merged them. :)

Just for context, we sometimes do a mass-conversion in a separate branch
when there are a lot of changes that touch both DT and source files.

If you only do a single board, I would not make that a separate top-level
pull request, so it has to fit into the regular branches.

        Arnd
