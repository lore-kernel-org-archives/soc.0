Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAA288C2D
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411685; cv=none; b=kytUJVdlUt2d3cL8AjsYOvRIkV3kYdhcVRhUa+K7Oc467zELTtcjjTQIVozyKrio3y4+OT5AR39xb+NQQvIyfrgga/LKZm1+Zdu1+w20rJI9OFLSQiRDU114cTXa/oaAtoA/vzuX+RhosFR4usHJniPWlpwWRCKw0w5NexlT5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411685; c=relaxed/simple;
	bh=ZFqJenKHf79crL8FtIJ8E7FQoJ2ItmaH9orqP1Mmhj8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD2QjYBadB7dRdeqp6LP3+7asEl7FiGgasrcfpWUgR438IlRWmyZLUBChJEKn3aQAbNlldEG4itIOijQA6wxTSsgBj/y55+/xbg8KToj0u1ZCAADKQnm3oW7q6cWdFOURLlU9uwoo2Z7y9Y8/1wFs7TTwVFTpqEFAbf35FkK2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lubf3GRN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lubf3GRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF23C1F00A3D
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411683;
	bh=ZFqJenKHf79crL8FtIJ8E7FQoJ2ItmaH9orqP1Mmhj8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lubf3GRN11yRP6pd3XtD9CF11ay8H0xWcijybnNwc7z/zgJGFwiA9v49GBdDJR4rJ
	 ZaUXrmc8fi+RcbawHc0XdafcLMy7Ne9Oh4Rmf3daWSPmcgDkxcEzVzw58z51lKGTbX
	 LbfdEslLiW9k7O5LmKtKdKGpPIYcRfT0v7OfH5lOJ4dpPxpw7mHkeKNXLglno8Aroy
	 xtQOlbf/E/z8EPgv3iuwElMi22LJ8OaESFnyzk01ih6p9XQdVPsUQ7bjCQV5wp+Vq8
	 D7g/+5b6lEvT7WqtG810HEZhLbyF/OBlOH1RAOLKRxCf5+aC2mjf82HvXH+wQR723n
	 sXZoMrB+zi3pA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b237fb695so34093941fa.2
        for <soc@lists.linux.dev>; Tue, 07 Jul 2026 01:08:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpMlNUEdvKt81wzTCJSBMF70RdwlYB8LVUjR5/x6Yg3NjlnYumZoD7E5n8mYsW9n3ldbSI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy14ZpIAMEPbzw5XjfenjPLj7XPAPPIthdYWjcYospjTYgcX6TV
	DS6IA74pLd/KYruElnFDzhgBGLWEbR+Ec9jXwq2DZsX0PmsgNasQB/Ttntvne3qK7uTd5XjEfrl
	12396mPfEshoFIGyPtedBkxu2oYLV7EF3Bu2PaWPXDQ==
X-Received: by 2002:a05:651c:551:b0:39c:6927:5c0e with SMTP id
 38308e7fff4ca-39c69275c6emr4674581fa.18.1783411682550; Tue, 07 Jul 2026
 01:08:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:08:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:08:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Date: Tue, 7 Jul 2026 01:08:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
X-Gm-Features: AVVi8CdXMJVBF0F-w40gf2-4DxP-Pr9ZrnyQOzWnxVH-2OB9v_JiQsUD63iUHTg
Message-ID: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 05:13:59 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch series converts StrongARM SA-1100 evaluation and handheld
> boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
> (struct gpio_keys_platform_data) to static software nodes and device
> properties.
>
> The first patch registers a shared software node for the SA-1100 SoC
> GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
> node directly to the GPIO chip prior to registration. The subsequent
> patches convert the board setup files to define static software nodes
> referencing the SoC GPIO controller directly, allowing pin bindings to
> be resolved via the attached firmware node without relying on name
> matching.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Will this board not die? Anyway:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
