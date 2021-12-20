Return-Path: <SRS0=iQxS=RF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E29C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 16:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9068C36AE8; Mon, 20 Dec 2021 16:28:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C221CC36AE2;
	Mon, 20 Dec 2021 16:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C221CC36AE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1HuU-1n25La3VVa-002kwV; Mon, 20 Dec 2021 17:28:20 +0100
Received: by mail-wm1-f47.google.com with SMTP id z4-20020a1c7e04000000b0032fb900951eso9996970wmc.4;
        Mon, 20 Dec 2021 08:28:20 -0800 (PST)
X-Gm-Message-State: AOAM531RR2SE0HOxKvp8fDJ92JXuqS7zmH8LpyESDpPAuZ4wJokp1kIp
	Yfdjuuwrszwaar128TtwanTs0dORpQ9MlK4MBS8=
X-Google-Smtp-Source: ABdhPJzUkj3i6PMuViKF1nX3C6bpcHTsNDurVwz/3TCnS0YI1CO6abZYHqYubf4bq0K4erlSr2QhZ7hBeF5vvUS0BW0=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr21879495wmb.82.1640017700357;
 Mon, 20 Dec 2021 08:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20211218071427.26745-1-shawnguo@kernel.org>
In-Reply-To: <20211218071427.26745-1-shawnguo@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2021 17:28:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Pi+9tNTfaNjKCLH1f3Ge4YLW9_7o1ci1RLeuTOVEbkQ@mail.gmail.com>
Message-ID: <CAK8P3a0Pi+9tNTfaNjKCLH1f3Ge4YLW9_7o1ci1RLeuTOVEbkQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/6] i.MX drivers update for 5.17
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bFuGpe0BIqZJE7y/sbc4BXLS80DL5xeE/RYFBTuJK++vHV+h+fR
 FpGCDv02ThierqjBoiBhTqYMJCiUtxZozrjDYjHm6pXZCvBgc6lPzRHZCqP3RMP4S/KvWMC
 4dbaQt9TmZ0kzy1oesV34pItv1V645ovO+fzxScoqytpMIrldUPSDyIOJAAJgQ8VFS4fZKj
 7otefsoWURyN4d8TO58vA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0hsZAsNlDhM=:W2+YIY9rjicunw5F/8lLiP
 YQVByTpa+ePukKIHx9ruDF98tDyYwkh6OHEMSXZLrHOtgddyR+Ur40mzLYiSOzQT5T3jnquRL
 yfQSY4y3iZgYbUzU7NBcckPe9uVnQXb+f7i5TSlXv8jIXJ8u8/yyIE2Whfc0XlO/pISW/YAT9
 CG4x4Z1idMjI/cmvkprNcAXBaOELJd4vZoyQ+XLcBF15yPD3aeeWdUPv1dk4XTQslW01ljJgg
 OqNrYvAGdEdtr/SfqxC6IIMoRw9fJFqDEkC0zHyNsi0Tv54Gkf8Ew/kw8exiZDnTJN1iiOL0U
 N+9Vr6DsYzuVWVfhyn1xCDuf7cDVichYAEGp1D72bukvZI/+d4wdcg4oEiLb6+F4I03OqehYG
 uM5pu/uYyfJJzUWUcMQjjIYjqrEw3GGI/1Is5ZzjgCLZva7MPIUo7Whq7L2wqc98yBpMQQmCz
 TQ8BM+h9wCW2Aj1TkZAJ5Ily0pju+gLgeiNo+zCRz9WPLZUyljpZHA0IZBWO1AA7+jsMCronl
 CNoKvQEztWQrnnVHzi6WksQeneAv8npSvqWKOf8dUwOKVKQkInWp6lw8jU+XKMQGMmO8WAOis
 j8AAifjxlis7eQGJ6db4DqBpJPGd0DkqLDZFV+Fhx8mtJhSzm6gSMH0c5yN057IWk4vrg9vz9
 ukpEFkE+ZcPC52zfPxJi+CJ9Xd5m1zKhIw+WyyEwljLEj6NFQ94zeMifYdIlNLuohMTDyYCqU
 7BDnwmKT444B3qEzLmmuhYM9O7SFHBdq7g76LfuPazKroBhMmEwbQ18knRG4yRhCqJAgu9qtY
 6rfM/Gqbj8LvWjQyVhkoqKdiixw1mGEhovwbThmsyjyPbTFTRY=

On Sat, Dec 18, 2021 at 8:14 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.17
>
> for you to fetch changes up to 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c:
>
>   soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl (2021-12-17 10:53:20 +0800)
>
> ----------------------------------------------------------------
> i.MX drivers update for 5.17:
>
> - A number of patches from Adam Ford to update gpcv2 and blk-ctrl driver
>   to keep i.MX8MM VPU-H1 and i.MX8MN GPUMIX bus clocks active, and add
>   i.MX8MN display related domain support.
> - Add optional continuous burst clock support for imx-weim bus driver.
> - Call pm_runtime_put_sync_suspend() instead of pm_runtime_put() in
>   gpcv2 driver to prevent a sequence issue seen with i.MX8MM GPU and
>   MIX domain.

Thanks, I've pulled all six tags now, but I don't know why there are no
automated emails about them, this seems to happen for some senders
but not others.

        Arnd
