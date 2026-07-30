Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68247A886
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454496; cv=none; b=qq0rZIV1ShQQZBGqNRjvfoPnWYnfYllgxMMFPMbVMJ1BP522K+Oo2XYrUKXuV9BZIIUVEi5CeoQ711WVsX/C2rgUpGUGkJApDNu2DUZpabrDWT0YbUbtILueVdk6ZSbwRwvX2aqXT/4yBpCdIfXAW3g+hShX0AzUzkw09B2kRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454496; c=relaxed/simple;
	bh=utT5GH8JwJmVzB+0txH3Mifzm/70gcqs7ugOLa5BO/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4jelYFU6TR2LuBhL8lx70vWd2poEVnzRPzE2J/Yhi9Cw0G2DRUkPTDNvnqYwUb8a6rzH1tcb7qAhjndrm8KZu8FOvQOrClubJtZEY0jf/ZzlhlyZgHDEjs53z7VGq5t81/ixZZdMISLxYh6rXHizKkAlUZOe9hcqjN2lW/mu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oeo7N3dF; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oeo7N3dF"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso179743e0c.1
        for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454494; x=1786059294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=Oeo7N3dFol8bJywDJ0YKJ9uOKodSoI3wYuALnarDyoVXVExpBCNtB8dS2BCOlPKbVO
         IcGqHrj6eZ3wjEiFySYadIEXx45ztUvN+f+Do4ZXyFPN7QJfkJ4ubNBxJ85PDKt3N9Fc
         18zBCGUcrtgAhJFjvvMVgBlAHzZEAe47+aMyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454494; x=1786059294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=YHWeuNryKpdRXxsGwI38DX2BQ5XyB/Fflo2gF4nt4s3VLd+6ZSMiA3i9EM7vxfO/MA
         d2prBZARC7aZng88iDmDzyMKHF8stpn8Ewvq8lkHYHaI1sDvhUHUgH7aGMRRyehd5q+4
         fXhf9WUGYoa2vThYyQ8n/LDy/FiYbsvalqz/YQVjPF+bcPf4WmfVZ9NJRCANiN1A3Tju
         3P57QSEiBQ+6jnmo6bEoV6AN5TuKof8oy46/zadVzgVTYKQykTcfbxqRBRSlfLQ6s455
         yshRWnT2PFUMbv1f2+4bopJ9QtGAy6p5iuf2Dpvzg8pqX2s81e6GmIt2y1CntcMVgzkl
         4PNA==
X-Forwarded-Encrypted: i=1; AHgh+RpxCyPTaZkmsydVHLydk2BRF1w4AvEHUWwf41IShTnG1N3bEJUJk7jujF6AQeYLgl1v7jg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwcjxdPRCGovAcm5UutLb/J81vKw7ayHvoZ9/rd6iid3YkAV8b
	l+5bOHqF20RPq+Xj26d3VXKPYfkIVmzqUFsI3CQZj9UApVWtKGgYgNDzI1VZYAbvXmNaKubg6Qb
	yeBo=
X-Gm-Gg: AR+sD10YQEh9/JDRtvawNsoh3gVBfUHgQXQ8r8aTBbQ/lZzpNaspGYXp0Qjp9Uc678n
	3kXMTYJ6ZZipAs5+rbPzS/I4ifZt1psotTLMGxwHQyuHMcZrI/RnbXmOPTi10bWwCPbscOZ3urr
	diVkUshU7fFAc141gAF94lR9m/4/KFYlNchSsH3feN0ZhOIyGEEv23Zv1fpJCLB/xM7hvZcWC/s
	BWch0mICPDr+ym2vxl0P8w7kUO/hqd0YO+pL67sok0FIR9E7LcNRpnxAlXc+ZQYZihMOHYklPan
	/6q5McaMlewRNZzJkhlVkbrwhvm7KDFJgtx1kLkhrxZGg0tW8yHw5LhZpJnKGD5o6iBgjshi0TP
	hIHkmf243qghY4f8mC5USsVW0KTuO1lzbqJv2RZQtz4SW5kMx/BqDk/OAGKBY3fr7b60KPoutTh
	CkVQX9zx19zIXOYuU5U60PXmUDhH6LMfjS1U7PmQqdIwg4DyE6jGhGHUfxKgJIkecbbwtPwa3/p
	niqRX5ShL/j+eYPsp0ELbKfMW4=
X-Received: by 2002:a05:6122:378b:b0:59e:372f:6db9 with SMTP id 71dfb90a1353d-5c36621a22bmr1486189e0c.12.1785454494116;
        Thu, 30 Jul 2026 16:34:54 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c366743c81sm2614056e0c.15.2026.07.30.16.34.53
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:34:53 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96944741eaeso93479241.1
        for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZXVb8DPwhoQGPqENXybrUvA6gCMfDJy9yZrgeSdb+duYBSike7MHuGuWs7tZpCfgGNus=@lists.linux.dev
X-Received: by 2002:a05:6102:511f:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-7574e1d5298mr1438306137.7.1785454492526; Thu, 30 Jul 2026
 16:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:34:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
X-Gm-Features: AUfX_mxnuq3KCnn0XeSL1ZB4QNLigMdFRjElx75voPzjUsE6soU8Kl1B5ccPok8
Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Enable the Google Tensor G5 (Laguna) SoC family in the arm64
> defconfig. This SoC family is found in Pixel 10 and later phones.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

In case having a tag helps:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
