Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC6268C67
	for <soc@lists.linux.dev>; Thu, 13 Mar 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741878503; cv=none; b=cS7nQdl9BUWBdjD+DDFWp1WoYTwIugph6mFNGkK4UXd0T6YUGX9oyioDLimoPN82X7emwxudI7H0ek0VpbprpW7rjSy5Nq61HheTxyc6QGWTt48ghpjwfE0SmJ+MSdl9ypp4lQkSChCKMOuUXsnOqPXnjLxzJAKWWYceYrn8pZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741878503; c=relaxed/simple;
	bh=BZmdNCZ5/qRxlx0SPeoGB47Ed8FZNgHI2espj13qmpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5YtxZ9nvG6/ScBjHlNILJ8R9Vz4M6MMgjZy/qbrz9t5mSFE1S99EaxlJfePMqWIDclIzrh2mi0guDGl5FGDFN4zF3x5gfJin/Pm0YHJ0Q58TqSJn6DiUoCDqFNcoAqyA2wS++YEdt3g9w9GLqnUJPmoSIW6ehOOmCaXasWz5Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cD92mk3y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cD92mk3y"
Received: by smtp.kernel.org (Postfix)
	id 4BDDBC4CEEA; Thu, 13 Mar 2025 15:08:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13866C4CEEB
	for <soc@kernel.org>; Thu, 13 Mar 2025 15:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13866C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741878500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVXcsr7GZMEAmniMdC/b6umj6ZIH2ElXr2xetOJBYLo=;
	b=cD92mk3ye9xggKbem60r4kjATb3xJppduY5U6riFQTsTpDIHxcZl9dXytN/yM8iW9MZdRQ
	1fTUK1yRuCoqF7uz/9t7wvzKsa5fTm1uGdDN5R8dwEEjMQGy5TaaTm3YMAvGrYSdYPcur9
	frOW97IT0DAXQyllrrBoCDCykz5oaO4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-t9Sy4Ga9M96Fc4AmcwMV5Q-1; Thu, 13 Mar 2025 11:08:19 -0400
X-MC-Unique: t9Sy4Ga9M96Fc4AmcwMV5Q-1
X-Mimecast-MFC-AGG-ID: t9Sy4Ga9M96Fc4AmcwMV5Q_1741878498
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e82ed0f826so891170a12.0
        for <soc@kernel.org>; Thu, 13 Mar 2025 08:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878498; x=1742483298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVXcsr7GZMEAmniMdC/b6umj6ZIH2ElXr2xetOJBYLo=;
        b=FDxclFnc31ouqNJsAjyGZQhBhJs0/C41XP1kAV7vHq/EouQn1HfgO/1YtzDJAHexz7
         Fr/Q/MsO+jLVJ7CAn+fPXjffnmwDfhbIEcu13B88xNYgQGkxhgmK1KcEzkLV+MBfneTs
         dx8L8MbBDudVaZWpjaKmoiUFlcfCZJlaNQjAwixRAcW028bL1JKI1dZygxUf5Q7CKTJo
         /ysiVWTQpftmZ7sSg7zyX2sRqBesUDbN50ziy+C7JPkoOY3gQKx/8wBTYnUWJMkXW9se
         kwEv2gZROsSuQa+GTruHoqIBFQUJ62DC5b2brmzlFZarQK2uGLnQgOtMNOu57h/HTjDW
         Hn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvU9HnB7aq+PLejCtN024vLRhv6m1O9fKl4BTA8YRORLkKrptfv6b9lMzkQfyRbyGKwUI=@kernel.org
X-Gm-Message-State: AOJu0YxoS5UeiBJR3qM1nDCsoHHGwpjs2sb1UAHGrkUa3XNS2UMQ7nV3
	Ps2NcGBej2NS4eu/s8FTNWe5hWqChB2humiW6MLUd83LEY2upyM7qLg9hf23/UjBGQtGOszEzKK
	PMzaJ8zUd4FFN1GNoIwcBaFfoj4lq7UVZVLlUhiMZWXU=
X-Gm-Gg: ASbGncuW7uyq4Alwmgpwntjym8T80A3OfzFGTEBauWca4zCc44LrcFfDVvrtvR4Kud2
	iFbgyFy9gS80Q8TrxEB9+t4tNgqDmC7v+j09FL68SOPYNe9CzHEffqE9KFhG/WdxuvIqXjCjmUD
	WvBqFjn2AWKWU2rbdbStHQMJc+p0s3npYGyXusEXWcqNqSZDEO9QKjPYTjAM+Jzqspzeu9yZe5D
	Z7xdWEcVu/GVevUa5+ELoQZJ5BrfudeURCRFDpROB1amfbsQybQrclsCfTpax1UaShm9zcIjnAZ
	Ife9o/Mv8lW/6E457jZCJ2HxDy/u4lr0mJSrxtifYy7rrPkl7YemL/RX7dfeMgzG1e+l1yuLjVc
	2Ykw0fb4xFm1a/cnCVR70Fut+jwnSPe+iYM5nbngasuDNrfQU9/Zkf9cTdv2C51qSOw==
X-Received: by 2002:a17:907:94ce:b0:abf:69e6:4372 with SMTP id a640c23a62f3a-ac252749adcmr3564776066b.4.1741878498250;
        Thu, 13 Mar 2025 08:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfz8dFEUeqIRmnyOekkf1jHZOOgVGjHfESNlROwH3AaptJBdPv/biPGWbLkHziULBAePb/Lg==
X-Received: by 2002:a17:907:94ce:b0:abf:69e6:4372 with SMTP id a640c23a62f3a-ac252749adcmr3564747666b.4.1741878496272;
        Thu, 13 Mar 2025 08:08:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac32510726csm9933266b.127.2025.03.13.08.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:08:15 -0700 (PDT)
Message-ID: <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
Date: Thu, 13 Mar 2025 16:08:14 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
To: Francesco Dolcini <francesco@dolcini.it>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250313144331.70591-1-francesco@dolcini.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GGNV5Kin2oHhwPktnkmvQnLe1DUJgkq6C4td9R5f6bI_1741878498
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Francesco,

On 13-Mar-25 3:43 PM, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex Embedded Controller, currently used
> on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.
> 
> The EC provides board power-off, reset and GPIO expander functionalities.
> 
> Sending it as an RFC to gather initial feedback on it before investing more
> time in testing and adding the remaining functionalities, with that said both
> the code and the binding are in condition to be wholly reviewed.
> 
> Emanuele Ghidoli (2):
>   dt-bindings: firmware: add toradex,embedded-controller
>   platform: toradex: add preliminary support for Embedded Controller

Thank you for your patches.

2 remarks, as Andy already hinted at drivers/platform/arm64/ likely
is a better location for this.

But as the commit first adding that directory indicates:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=363c8aea25728604537b170a1cc24e2f46844896

The reason for having ARM EC drivers there is that these are for
x86-pc-like laptops with all the typical laptops bells and whistles
like EC handled battery charging limits / spk/mic mute-leds built
into keys on the keyboards. Special key handling (like mute, kbd
backlight) done by the EC etc.

Since all the experience for dealing with those laptop-esque features
and exporting them to userspace with a consistent userspace API is
in hands of the maintainers of drivers/platform/x86 it was decided to
add a new drivers/platform/arm64 directory maintained by the same folks.

If this EC driver's only functionality is: "The EC provides board
power-off, reset and GPIO expander functionalities." I'm not sure
that drivers/platform/arm64 is the best place for this.

Also you mention GPIO expander, but that does not seem to be
supported yet? The GPIO functionality really should be in its
own GPIO driver. So it seems to me that what would be a better
fit here would be:

1. A drivers/mfd/ MFD driver with the regmap stuff,
   registering "board-reset" and "gpio" cells

2. A drivers/power/reset/ driver for the "board-reset" cell,
quoting from the Kconfig help text for that dir:

menuconfig POWER_RESET
        bool "Board level reset or power off"
        help
          Provides a number of drivers which either reset a complete board
          or shut it down, by manipulating the main power supply on the board.

          Say Y here to enable board reset and power off

which seems to match exactly with your current EC driver functionality

3. A drivers/gpio/ driver to expose the GPIOs using the standard
GPIO framework, this can be added later in a follow up patch.

Regards,

Hans


