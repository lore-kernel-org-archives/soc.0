Return-Path: <SRS0=Afdu=NP=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2102AC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 20:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C457C4AF1A; Thu, 13 Jun 2024 20:56:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 441B3C2BBFC;
	Thu, 13 Jun 2024 20:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 441B3C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso17972701fa.3;
        Thu, 13 Jun 2024 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718312203; x=1718917003; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z66lGxhnOz8HFB5QRVsguRUEpjfoVydz/yGQO+wziQA=;
        b=ixhyc8kiB5ymxvpB/6OOjqiHGarkrrVzW10WujGz/Fvk7rk+1QkSpSv/cobknRNo8Y
         IR+FOoOy2pVQOwiO7VPSHhAWQQKYHGHaIIdCtdrIiZ/NbL0MFyjxR+qWarlHb/zsAKKv
         kD7PzCKfZy72/k8uiMOXFAbs3SEdtXXa3OvTT99Iufot8MU8FjgszPl7q9d2W5fRH3uq
         QOsZE2C1gwHbQCn428Uc/dMkQy35nfQgRnDyDzGtmcTzxmXvmJJR43r4/l+noXIIhHeq
         Vz2NDkkuztqV6w7db3UpQJG6Jkgm0jjS19frVDmfVV+FUXFgqjP8w/IYUo3tqK6PtaFH
         UsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718312203; x=1718917003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z66lGxhnOz8HFB5QRVsguRUEpjfoVydz/yGQO+wziQA=;
        b=mdoVehP4E6DrhABh+kv8tHrkUEUKVyi2bnGutJYPyK5PF6gMNtz7Vzr2AU0qLn5+N7
         7k1YKgDpQu/BfUWG+eYgssORK4e7NgTZfENmXDgK6EJZWvFQmn3Ct1LzDP3fTWPtN6Ll
         vUflrBBkt7avKv3gqgLSX8qp+rAu+80dNsJTn1uqDtRIsv+rQf/7CFu80l07LqzCeejz
         CMGC9u5hdKjbn8Lqtq/ua/6pCPO8SIIiwtRZ8hD5rtYvwLsZOt4sQj1ssPpeqYvIgLmQ
         OGnGZ/3lF1840eqBMgWOZ7YBuOrJdgaWDQQ7gXEfMv/hY3R0ch9Un/mOn11ZFZR/sEUF
         rp4g==
X-Forwarded-Encrypted: i=1; AJvYcCXxjZUynBRan/Ls42hXklC8VOebE5SmjOdkU7ZbKNiRP6QeN5jUIjtIe35n1j/aShb+Jkh6vOw61P15wpGLKYJWJc9gtysQTzO/nlKb5uMobOOcD/gPlEW+cmYjh6FCNA==
X-Gm-Message-State: AOJu0YxbzllzTC0CDsTWWUbtTNhYXwwye0njGE0CnjMBd6YZct8T0l+Y
	dU7ehiTk+UyGhvb6rixgr4rjbMyxVTYMMcq2Yg5tkecrvXMotNMYR2dbGqdazw1zAeiYyhSlf4l
	pujqz4K4bdfOdEDRMq1cgEDD4jbuL45Wghply/g==
X-Google-Smtp-Source: AGHT+IFqpOxTPxPsth1ufZqB6boWJKhXU7tioIee/IF8PSM9zxVWRo0ygptKeIy0HJPUkqXlgt0GmXXwf/aOhc/BJ/k=
X-Received: by 2002:ac2:5057:0:b0:52c:80fa:2967 with SMTP id
 2adb3069b0e04-52ca6e55ce3mr526794e87.12.1718312202854; Thu, 13 Jun 2024
 13:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-13-kabel@kernel.org>
In-Reply-To: <20240613161045.29606-13-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 22:56:06 +0200
Message-ID: <CAHp75VeAryFmzyoN5tv3ALa5G2UcnMfdOAUaAbH=p8PxfcXGFQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] firmware: turris-mox-rwtm: Initialize completion
 before mailbox
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Initialize the completion before the mailbox channel is requested.

Sounds like a fix, does it need the Fixes tag?


--=20
With Best Regards,
Andy Shevchenko
