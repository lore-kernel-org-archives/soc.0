Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E352AC00144
	for <soc@archiver.kernel.org>; Fri, 29 Jul 2022 07:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7F30C4347C; Fri, 29 Jul 2022 07:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A2C433B5
	for <soc@kernel.org>; Fri, 29 Jul 2022 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659078947;
	bh=Fi356vKtgE3D+VrJoWLIsFUbDISxFmptXTKi08aJmbs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JcSGBv7d83Uon65gVnFC4Ui+MAkZs4d6num+B3JotsWI0HZFHlVdd9OLUDZh5+UpC
	 JLPNoMtbh26qBsCXcyCWWTw7N2W2EiyRiuhWSpQ3Z+idhGOJj4jHEeZtXXL1Fa5sjW
	 0et6VpKXS02+gUIS3Mq1WtAE3hr+mpmHo35oSX61f7flYpI4Hhe6wHHFircr/LnIW/
	 6LGW3Nvt7gtWyDRB1xLr+hSA9QDUMyEMwMHyHE5a9CxeliImcUZRx/IyMi7rP0sfo+
	 HN6QrmAjsvZyKArPFdVhFZPQwa4RbBfviRRc2cTdZC+DFKpFk81xA4kKYm+qVDC3/g
	 FFGKjO1TbX0dA==
Received: by mail-ej1-f52.google.com with SMTP id os14so7008391ejb.4
        for <soc@kernel.org>; Fri, 29 Jul 2022 00:15:47 -0700 (PDT)
X-Gm-Message-State: AJIora+RU1Aq8EhIEtTojMxKgs/3aA6L0hVBKA0ywVhbFk8HRGGRVUj1
	egU9Oq/Wjgj5rdpi+nFKukB3bzaqk7PaWsaNuPc=
X-Google-Smtp-Source: AGRyM1vi03fgHseU8LzaUVY9VKf70dalX9+d8sUrvXtLkERi7j2pxwwdqcc8NGhyI3Jzfa5R/EYW8ErH/xgcB1Fpq9Y=
X-Received: by 2002:a17:907:d0f:b0:72e:db1f:9b91 with SMTP id
 gn15-20020a1709070d0f00b0072edb1f9b91mr1924189ejc.470.1659078945841; Fri, 29
 Jul 2022 00:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
 <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com>
In-Reply-To: <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Jul 2022 09:15:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0L24AxQD_72bHYY7CKvnvcYi4e_+Zq_n6KqWXzD7-G9g@mail.gmail.com>
Message-ID: <CAK8P3a0L24AxQD_72bHYY7CKvnvcYi4e_+Zq_n6KqWXzD7-G9g@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] SoC branches for 5.20
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 1:15 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Jul 28, 2022 at 3:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > This is another large merge window for us, with over 1000 patches from 177
> > contributors. I'm sending these early since I'll be out of office for the next
> > few days.
>
> Hmm. I'm missing 2/6. I don't see it on lore either, so I don't think
> the problem is on my end..

I got a reject from the mailing list because of the size limit, not sure why you
didn't get it though. Sent a smaller version of the email now.

      Arnd
