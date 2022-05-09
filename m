Return-Path: <SRS0=y3QB=VR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3689EC4332F
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 14:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2182C385B2; Mon,  9 May 2022 14:27:02 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67CC1C385AB;
	Mon,  9 May 2022 14:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67CC1C385AB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3lLh-1noL7J328Z-000psI; Mon, 09 May 2022 16:21:46 +0200
Received: by mail-yb1-f170.google.com with SMTP id y76so25262584ybe.1;
        Mon, 09 May 2022 07:21:46 -0700 (PDT)
X-Gm-Message-State: AOAM532Gx6MSPf/dR9usfUExJqdelFzBnNca7lAy2l11Gwz2umtG8bm8
	3TJ23W09kpNryYSpaBQpQeS0tusIZ4RsWLUOeps=
X-Google-Smtp-Source: ABdhPJwY5hLObxWceU0lTlqAEqwR+Th22pyO/ruNkfXVChk36C30m56Q45dWjQP0Zg2DA4IBJXRmMg4CO/psSod2Fuc=
X-Received: by 2002:a25:cbc9:0:b0:645:879a:cdd3 with SMTP id
 b192-20020a25cbc9000000b00645879acdd3mr12792799ybg.550.1652106105319; Mon, 09
 May 2022 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <YnVUmSLE1MZFkApt@kista.localdomain> <1789096.atdPhlSkOF@kista>
In-Reply-To: <1789096.atdPhlSkOF@kista>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 May 2022 16:21:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
Message-ID: <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT changes for 5.19
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hSpSWOhSLZdX1RqAXGfOTq1LA1qJBVWNMW7axUg/UpRS/kotEF3
 8mrsuKTyMHcT48+JLW7/n2sXFuMtMGIPReGld7+NF0jG0KZMQFaiigDIFyqiEzrLTVJrRiI
 3bVxGt/EY5DpqyByOKO4FvcbeMPh7YieSD7V1aoEqa+l9uOMrHgYKvZ47mzCpG+4iiL1wix
 RWXgLS43ZzWSyvlWr2/WA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HiCPkkeMETM=:0DASb5i6puASjNgEDUQUWJ
 672RYWK6ydmJw3b78zY5dJlVYZdVocc7GNlAVIhT97Gnz158sb3AL83jN5bhNqdugjWE45k52
 s+AixDL+L/9/aUHsDMmrMSY+bfxauFXTVIrJc2z3nkIZ5+SFh9TCpqWJQSkdgtarAGMQ3l4DV
 kBNX9fp1tKvS5rRTPw8YBoha9XfhBiTYzeGme1zV0JUvC5HRG6nePS9TEA3TK/acKMCYue1Zp
 jpEsAtUmv+6Cz4CaQt01uOY0DTLyFe68QbIC3ohsz+yFlADqt+Fx4mJHgdOnJTumbUKEM2/1f
 6evitSJCyFznJH/XzrYi9WBo97xEuC9Xdeu/q8posXyuI5kFlLqy6No8nzEil1jwkUFOOxuW/
 QJVLBN2Ex+yeSEUSrx2JlGGnS0Irxe5AHlyGfqQzvGi1JLeEYlNXphJLKYlWFkoozApB4+ngK
 tyE/B5UEokQXnHchucYgC8U7MFsDL67jALIgBnsTdye5K4OuNp/w+t1yX0TE11hwk6fVafcSu
 KJjPOcmpFmJn5+8ssnV43/miLWVZzlMGxW/RZ531GGg+K68/XX7ckIiCwHrnAWPcmOdAFjcBY
 tJkaahpkTFiMHHZupyw1034TjQyIUQUedy2ZKm8cHTWbwNcjVTdcpy61tVtQxTQOwCDJNZ3fb
 5NKP3ei723gmRRgjg7yF8xTB3YQXlS0tsmeizJeAaJ+0Vll1xlYl2wfleprmiutxYL3U=

On Sun, May 8, 2022 at 10:52 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
>
> Dne petek, 06. maj 2022 ob 19:02:17 CEST je Jernej Skrabec napisal(a):
> > Hi!
> >
> > Please pull following DT changes for 5.19.
>
> I missed one patch, please disregard.

I had already merged this one, merging the new branch on top, while editing
the merge log to not mention the duplicate commits. You can always follow u=
p
with additional changes based on a branch that is already merged like this =
one.

        Arnd
