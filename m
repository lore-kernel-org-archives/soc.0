Return-Path: <SRS0=H4qX=QP=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CEBCAC594
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 17:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06A90C4CED6; Tue, 17 Sep 2024 17:44:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E65D0C4CEC6
	for <soc@kernel.org>; Tue, 17 Sep 2024 17:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E65D0C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so38743035e9.3
        for <soc@kernel.org>; Tue, 17 Sep 2024 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726595051; x=1727199851; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3hkAjhgPl/2TiN68DozWvPeGYa77vsjX/Twty+gyE3c=;
        b=kFTYutS+I2PWFiB+xWRovz9WsNquiTVYfDRMumuyT3NDQNgBfeJiWeTgwVOuTOLBok
         M4uhCmmMjV1gyTwFhGHT5UinEHOIKVhmDwJyhwGMrgUcMpTob5Kk8vIZfN04oV9lkxCn
         9/X3ckdd7L5AEEYXdRAquJZr+4yQMEsZ5Tm+kmbwwEysIoF+17QIp4+axJbfxLBPzdfn
         YsPuW6PclGF1JXqPjZYxzDs/15lHS1/YBc21lnA/48oq/qfkoDw8WujM/qOIwePcECTU
         x0DqcG0NhRMJIj9qkbjGGc5yiPWPLiS9N8wU2krqA59tbOxrP3Ik58UOF+uwJ1htZBfx
         3eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726595051; x=1727199851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hkAjhgPl/2TiN68DozWvPeGYa77vsjX/Twty+gyE3c=;
        b=KaBD/q9M0fsA8ZH876mbCuU0uSYEgg5s7dR8te2450RYAAEjZoo5J3i0YCuk4Uqtbn
         nSzh3kcFyQn9nNpp+D7As/hN2EBfWf8/yWE+5Wc9PeVyr+Eze8T3mrxtbkQCLV22n02S
         R77KL6WrEaKCkFxK4i3uvByFbzgzHWRd1uOq69s9CtvoW//z6Kjs8EuyFBNf1IetZfmG
         SGTRJUnVK2lfHHh9zdDurh6MpR4BWYgzBaBM090u7pX1KSA+wAmH7Kv/SXaNfl8DDK+o
         4JLfqCKE+h/2tAWfPSvuaa2T8F3BSusaaTJjnWkgWnrMZpCYEnB1jCZObdbB1slAEUBA
         bzeA==
X-Forwarded-Encrypted: i=1; AJvYcCVGR5EiyZ+xLe8Xz7nUv20ARXB5wKeXMx6GPAta4R0RiovUfgp7Ga3xIfrUaaZ63UZL7vU=@kernel.org
X-Gm-Message-State: AOJu0Yz+rqc/VaMqRYaDjvD8d5cb8M/LZNwEaKsI7J6jAYfbgH7kRUVI
	DPzQEnxb++6jYxM4tlw0cl60LHMGtfaxezMQZ696mVvnBeFhjpoq
X-Google-Smtp-Source: AGHT+IE05nXrpogTVppn+TE+u3C2kzmxZtRMiSNDpMkPM/H2DThZtaxhtrJNkzwEUr8JDQ3aH93WGw==
X-Received: by 2002:a05:600c:63d3:b0:426:6a53:e54f with SMTP id 5b1f17b1804b1-42d964e10b0mr95965425e9.33.1726595050816;
        Tue, 17 Sep 2024 10:44:10 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e6c71c72fsm13954675e9.1.2024.09.17.10.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 10:44:10 -0700 (PDT)
Message-ID: <6309bcee5dfa3a1734b5565733cb819bce5da626.camel@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update EP93XX ARM ARCHITECTURE maintainer
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>, soc@kernel.org, Arnd Bergmann
	 <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 17 Sep 2024 19:44:14 +0200
In-Reply-To: <20240917163401.6501-1-nikita.shubin@maquefel.me>
References: <20240917163401.6501-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0

On Tue, 2024-09-17 at 19:34 +0300, Nikita Shubin wrote:
> Add myself as maintainer of EP93XX ARCHITECTURE.
>=20
> CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> CC: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0MAINTAINERS | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2cdd7cacec86..f9672f279a66 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2272,6 +2272,7 @@ N:	clps711x
> =C2=A0ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
> =C2=A0M:	Hartley Sweeten <hsweeten@visionengravers.com>
> =C2=A0M:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +M:	Nikita Shubin <nikita.shubin@maquefel.me>
> =C2=A0L:	linux-arm-kernel@lists.infradead.org=C2=A0(moderated for non-sub=
scribers)
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/iio/adc/cirrus,ep9301-adc.yaml

--=20
Alexander Sverdlin.

