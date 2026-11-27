Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774052;
	b=ibLcribd7EpZXsx3rfiuo1Rj/FJdNJ8NZGh4Ldl40mMOiKWT7i85e8pcPbWZJvmGmhMd
	 UbK2nu9Ji7GNap4rvL+/3vX5Qamy+tqsfaEaPB6LGFQBRbxzbcXTB+ypZ9LzCbDJVNPqw
	 Caa2OO7ob07lqbnZKdhWskWi4P54cIw71mzI5gHZ29yCINBTLL45R2FMrLyTHEfxcwUoA
	 O5TGVMAdKNMYgvc+qAhzpQnIybHvhRW0xXgpV66kVMx+WSGCrnifaDM3M4nB/xABGvemx
	 6JrsPLS7rfmM7azpMbqZb6mTRba/N9BMOjjCEFwnVum1IARv1WwHjR4ZsM2WUO+84dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
	b=PjoQZMGSVNpveo5U6weccKJND/R2WFexuYzrSHqAq5QxD7TRG0oIZ3zwYJpOzYtve3LH
	 wtARVl6y0tL6QFfoe2G6MRiLQWJg7glklz2l4zDetYv0ID5vZf4YgC5+gImlYcWH8cuDQ
	 dHsHqXLRSB+T4AJdlUG0eOZP781rmGROtZ3CRu+KZHudnMhTLhBoo1s7a29x133GYwk15
	 yFnuGKCmHY43Bm9h8sOAdn2hTpMo2kG0ueAhINl/CLxl5meT1zcIoEFvhjZqyMOmYg2DS
	 q6w8cdDwQc7FvG14rTeoMbnCfBLQ+8HY6FjrdKhcxXP+tGhcBfDfr+s5MOwUCzTMlKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmds1H9V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6E606A331
	for <soc@lists.linux.dev>; Fri, 27 Nov 2026 10:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C6E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmds1H9V
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c126f80426so7551780e87.1
        for <soc@lists.linux.dev>; Fri, 27 Nov 2026 02:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774050; cv=none;
        d=google.com; s=arc-20260327;
        b=iXgm9cVqQ9RYrKfrHF2mD8FJcfNp9kXPxRewJXQfkQNlYN0rpDdUcDdzbhujS8vHxb
         w8yZVNwp73DLtE3/0j1TRwaplAG3NbXUiWEOU8KGUpG3fG+rpbvuWHg1OxEC2AfBkWnf
         MdT84koY6KvRM/sdTmD+yOeO6uXAsNWfAGIrgAeSx8e6EY4Yj4eI3xVt7H+WHK/jYZwd
         GmlTinBq/jZCv3+WRHKivtGGXmDsUtumfs3wYQPCUPXolrwD0PkONXe4RUz2bAUASJvj
         jXthPStEc/CN/Z5Jux8qubteVGPu6oQccw8UjqjZTOv9/gir6zQtfTteABUd2X7vPQm8
         +D9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        fh=NZpjpS6HBrgpTUgebf9ScFkM80GRKwvi3mks6TTGWj4=;
        b=lqHrQfgu1ZaZ7I3K6rImm7KVIYBPgs3zBUCCdSURDP9KBxBjuUJfJ5k04AvPCrKjly
         EbA1Ml3w+yZQwUzZ8w75EFqeIBPeNSgMK9hdD6D6auwkp1P4pqYOwTlf6q76/NHroOkE
         fuZVnVtL09sHygc6JZV0e4kZhT9nxNAUkk6oALVWgBrkk9E2BZ8KmBNhjbhRw0CF5Ubk
         WIPUjwh6oLMdr30Cma62C4zk0wN92fFJYbix6tyZiEas2joBRy29VHDKHIjuzWV0xonO
         Tk5piFFoLLnXBg9PfXHXNFc2DhJV88Em74Ce3CpNGaNOTqsU7vAH/0/qpjhhdLMWP/9t
         fplg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774050; x=1796378850; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=bmds1H9VAHFcR0sO/w3hc5uz3sc0GrKbeIZTs2CP7igKEk13X8gqNUZgpUvoKWwqGm
         PxyXv6bYTrgkI0vweX85kOEAIsD0wgK8MgiC3w/9TBbC1RLBkGF+bb1VO5XbbUbHm4+N
         TuJKGskWYhYkkIxDNSeZW/ISzw89E0S15DkcfP8PBOVtfIJ06TrtJxdDEUPz4lrfFkG/
         9D1xmz0AdZbWcDvv475OPKT9MuRKNeG9Zw4BewEXnxOenIEh73fopeGzU6ouUpWRwaTy
         OsIKioqUsqF4jCkQB7LYYcJyQYY1hOmKrLk9yq2J5zO6JAhVEL2L/IqVz6S9gSN4N1Pg
         d4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774050; x=1796378850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=jR8HWfwPCt2QFJFERXctKmUEeuXSVPQBJwUHJU6HZLTSQnFQFVE/wlbEvlLCwoWBHM
         qYM499AnjE6pYWmnsqHc1a7ihRszastAMEeLqrqXih2u1BEdX2+GrxlZMGLd7ybf1VsS
         uqRQFmZrlmkgppGzURqKn2d71/icr+eCXTAIYUt64A/3/lOlo9ZvWEIY9gADueozviUb
         NF53MNyDW0xEIn3rbuDUjYiGguovEuQRAdDH2XJGtDyueIiU/P3+l5aK9OFM4PWaTjun
         NO2CzX0MQVYNMem3CUf0E+PH3Fh2SGcT5qFngHb6PtUjfPioZcX2sxF7xx8jT9iHOpUq
         yUkw==
X-Forwarded-Encrypted: i=1; AL+hErHugbxhA/2UGq0xG8Xy49nqObuDGvQx9Fmm+KhaF5xg2PVPD6KLSoFfAEsFpBk6HD8Ox5c=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BR0XjCVauADDxTUWoZtgTqBw6BOBGWtRou4gvrea6mYDymRqU
	x2Hx5gCEC/UFvIHf07Fduz/2UlhYEYQaBBWGJ5M6+zlTPcD0iuzGq3+cnQ2vUOC2Prsl0N3qdxp
	Dl926dAnouB+fHDQO+qM/hM17+TKbdLs=
X-Gm-Gg: AZFdTZcjTgwA+W3vE2N4wiqkRpeY7EZ0gq4soVO+WTe36+mOZ9oaokMAzNkjQwjkErK
	CPAoaHnXDAzlzALBnUrBER9nEXoD0Ee2Y2X/9rd2DyvqEQr4d7EvzL/afga4jyB2+fNQiAsiiCt
	723eVE2xsktiF+SJWaJ1aemdRJ+FWbtZtMr/7/F+002sXZG6DotdYQwn4g0ybr8389wxzq6BIB5
	9tVjr4tDJ4rQm/H5LhKj/+F05cgRp7+Uj2rN0mFJ+U3pxbkGa79UcO5loYx+nj6OnmNIV6SVOmK
	KU/2B+2QjZBAnN807q8S0diLhDtCpajwY/mYSkUskQLbbeBgnFKXDo1tZsklzpnG4dIOX0fUAKB
	u4KTPiYoRU8LjvLcHSpgpCI2ctgSgj544fLjlSqXNVJpezXFYPupQ7v/kvbYSkbNig02AO7U7Gr
	jGPIp191h3bpyMdJBVbQ389mDxJQLaZM0=
X-Received: by 2002:a05:6512:10cd:b0:5bf:f8fc:7b5e with SMTP id
 2adb3069b0e04-5c1bc89c61fmr6700305e87.55.1795774050347; Fri, 27 Nov 2026
 02:07:30 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com> <awQEP9bHA0RPfRUA@monoceros>
In-Reply-To: <awQEP9bHA0RPfRUA@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:18 +0900
X-Gm-Features: Aa3M54o3XA2vGbw-lT3h-QsKcDE27T0mWx-80FMotXTw-keuMBkBtHCZ9WsWU5c
Message-ID: <CAJGK9zaVJ-42c-AnZuXBW1uskvmRQv1ePHQsx=BMz55RfznomA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:16:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touch=
screen/at550-ts.c
> > new file mode 100644
> > index 000000000..89c2d2701
> > --- /dev/null
> > +++ b/drivers/input/touchscreen/at550-ts.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 =
draft. */
> > +#include <linux/bits.h>
> > +#include <linux/input.h>
> > +#include <linux/input/touchscreen.h>
> > +#include <linux/io.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks for pointing this out. I verified both built-in and modular
builds without <linux/mod_devicetable.h>, and I'll drop it in v3.

Best regards,
Yuugo
