Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53528C5A4
	for <soc@lists.linux.dev>; Thu, 14 Aug 2025 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158361; cv=none; b=k4j+Kg2Xfbo5/TApCen3rgIJ8Htoo2iYDJKRxOdaChApJReiPBfkj9EQyxynq9XS4WjghvAlsT4tR9umrP7qdwlo5hCGnRikIyr4ga69rBf6NY5kvsp2qcplPLBJWqJtRyyIPr/AUF1VfwYocQe6TUtnQjcSfKRJ8skNE0N9cro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158361; c=relaxed/simple;
	bh=VpKIa8LgibfoJADpoNgeGgl5dJ2VMP4Uoi/rmo0dahI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4Yfjhns1nidDun4KgN1mC7BLoQOyyiEOLwfykE4MCO0VLpncw8j9E8KjSYBEqwqmegnD9JIC84b44Ag99sG1mA2oTEWbT6encyUckmY5At/zmTTqn1tj2lj7m/jdlU34GFuchC+QGyFYdCjlICn6HjK7egXH5AMydulSRkP6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-89018ea8f7cso357785241.0
        for <soc@lists.linux.dev>; Thu, 14 Aug 2025 00:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755158357; x=1755763157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+i7bCdgaRO4PJGywSV9WTbQBb+KITW5yzAKza8+ctg=;
        b=MWL1IAZ1RjLgj+4SouCl70tmDgMws6ilSW4QhSC3DNABO24DA0/n1m2/ryPM9KioD1
         2VmCQ/zzauddlhfyGlsvxMjYkIUcnODiP7i2WzA62te41B0IHAmCjXJwndigH1+1diGx
         0xhZgGJTa4CkEZjFY5LWGA6dL6xb0iLDfO7oMph5urIwQCsDKUqTWHittF+LuAC6SZOx
         35Gb+9/voewIVRwe2mIoSKfB8yjjqsn+L+LgbocyIRBS4Cy5smGKTcX21Th7Gy2i51MO
         up8nAYywnEAk/OF6TkmyHO9SiXqw44E0Y5b7blgeBS2EDJVCymHXnuy6/skak0EFEMBF
         ZZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5LV8wzyb85N2IvpkUi4OqwEGrmKB9A7kH2WoXQXgvpZy7b2PPGdqmBR93jLirYZEdLRY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPTtCgL2eCtQqFyRVH6R3/q2SvN+wY4L3bvmz9CvBTpE1+kUkw
	qOPmelDahMLD8riIcQ0O37iu/ZfWB6ktTNiCvmnv4giFjW9zRu4E7QQexcq2SDsv
X-Gm-Gg: ASbGncsxWKe5fu1uShf2+qzruEVTtPERAph5X6/+a3GokG7d2VfPOwg6iM414XqF3hN
	CjDV+VZvpgbhxwS8SYWDjbv3NEoCBmrJ88z+nrvdNorNfYVajcTKI+cTOM3JDNmA8aksidnQrty
	zbBWh8ObaRK9Y+mGlNATpaun0dMzq/GdPaQZdv4xyFP/GTQXzgRcUVAcbSU+Xhusgnwf8fztWbt
	sKg5Fc9BcCIfoUs5lVDH8+9tqsIXbVLapmg4APLKZJxCVl87bef26BZvY23Sm6+UrOSMVjAkRNK
	FdB2cK3/VQhLRK27UV+PyRgd5/2frsxd/mWj/TlixDdKBxyFZ6g7ycngfXraXHcbfye9CokIrOv
	LqyNefyH142ati9vAigEGFXY9zUUjwgSkzkNU/ToywJjKZasdpY3U1rYe9kue
X-Google-Smtp-Source: AGHT+IGHrvfg/Q2tWpjDkPqz1O1mT7ziIoGrNgNWpylNtx0fubaTT0KtpcV6sdXhR3O1HrgdYhG7IQ==
X-Received: by 2002:a05:6102:2ad3:b0:4fd:5c41:bfbf with SMTP id ada2fe7eead31-50fdf8e5c2bmr679477137.7.1755158357321;
        Thu, 14 Aug 2025 00:59:17 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0268c86dsm2937875241.1.2025.08.14.00.59.17
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:59:17 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f88bd4b96so518589137.1
        for <soc@lists.linux.dev>; Thu, 14 Aug 2025 00:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj71kBBt1Z6hIU1qzplYOZxgEdZZgh6Px6NWi/IkjZ+8lw+iqDxNIhoObfU/hz2nMNdKs=@lists.linux.dev
X-Received: by 2002:a05:6102:4192:b0:4f3:1731:8c01 with SMTP id
 ada2fe7eead31-50fe9f8ba91mr647723137.19.1755158357000; Thu, 14 Aug 2025
 00:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:59:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXz60tBNh3DemVOmdYA9YT+aLGfKR-AGp7OT72gGkNOnQ@mail.gmail.com>
X-Gm-Features: Ac12FXyFisZ5qsOIsDXr4nfrcLgkkLJm5dx-Z9otnKfuIczkkZJm2xxpNDB0tU8
Message-ID: <CAMuHMdXz60tBNh3DemVOmdYA9YT+aLGfKR-AGp7OT72gGkNOnQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Use "DTS" instead
 of "devicetree"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Aug 2025 at 00:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Devicetree is a data structure and it is a bit generic term, because
> some treat Devicetree bindings as Devicetree.  What the SoC maintainers
> profile is mentioning in ABI stability are the Devicetree sources, so
> DTS files.  It is also more common during reviews to refer to these as
> per "DTS" instead "devicetree".
>
> Clarify that by using "DTS" name in few more places.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
