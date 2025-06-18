Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D42C3258
	for <soc@lists.linux.dev>; Wed, 18 Jun 2025 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248558; cv=none; b=ttp/R8ufeGIBz9uIdBidgVi0Q6LQITLa+scwKb50cmI8t+1IIneVdzibaDSfvWWZx7AaiE2KgX1SPcaOxTtQmrE+qUMMvBXK6BVX4oPmzWCH/pIsXs1jIgMQAUWVAfh1JblunXW+m3ErNpLlIFpiwxI1hp5cf0nj8RyKRJdnZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248558; c=relaxed/simple;
	bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKMPu9tzrQTF8KfaYtnjw2yoGhA0AaA+5GddaJyryVijOLKaLE5RRitEy0Ta5HZz3kp6GVYvd7XixoL6ijbkiOb0Apu0iOfAU3wRvExvbb++FPhjdubDz9okul3atnBHBBf2AftQNib41wnBDA9Q9fxnte3jC5Jbv2pMRViWlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbewhQG0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbewhQG0"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5534edc646dso7282759e87.1
        for <soc@lists.linux.dev>; Wed, 18 Jun 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248554; x=1750853354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=hbewhQG039c5DhiaXZDJ+3zgifzkZVBHTyXDLMPmDABAsyjpX7RnBbckFQeO2GWaZu
         IMyXem/X1XTv0LSkSloVJeVe5vUS4shfPF98M/isyijMiQneo+AahNrODov6Un/t1i7D
         xJw21hHGurSW2Xy/Cequ66DbSBWcH3ecfg9rtDaWdMURUyJJR2GHaH+lTOy+6SMxFmIF
         6Ah1DJ/Dfs1pTKoCbvlqunSRCYxHQkatGnOj4I6F1R/HyOoi4O2xa2B2qhU/+rt3oFuX
         j3W8v6+WHyov+2fIOP74NEdfI8tzk07AwlkhdjuXf+hb24vZTWeDNusjG6s+JF6dhFPi
         q/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248554; x=1750853354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=OM7pc1KA1Z+6Z8SKTcDRMmbnefzct7cTXvhvXZjBfKk5vlhdgnZye6HRe/slC64HsU
         dZalLdS3R2PKymkF2uARBAjG404PWqyOVdoKHNp7V9JauHPQhQlZVtG7+V2aOOUxMHzM
         OeJYnOWB7VN9X19gFQnvknfnaoTZHEQ7h+BxndhdRA/U0Ws4pwtYFQatDazzGMFlbRoK
         W0c5NKMcAJoRKzJCDhWb8VSFEu3YATcoMJLQ9TcDkubJ32bZh0m+PqFKzvFKujYgwWd2
         zQEV/cV72VC2nPnr/0bJYjDU9BJvT8aedT8h0d2zL2gcmhy7/mzp96pYpoyANo0Pb5X7
         BJfg==
X-Forwarded-Encrypted: i=1; AJvYcCU/hdR3/FgcJNI3a+W9nERFFbLTnVdCL3R6A7FOy/mN4pkQ67QOuYv8oKPdxA8BYkq0wY4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3lgZuEvf0p0Z2NgA5XiYvHz0Tdyh0vFlIbUUTDyri29szKmRI
	mUknzmwposC2ZFo5MGXpgugxi3Y4Dl0mzdg3KcpBLexO0aCbezNA5pdYBhsYAFnb9SvcGEOwmZb
	6cx5/nH74fF3EFQ+tQ3Op8jtDzTDh1TKqao4Qy+us7A==
X-Gm-Gg: ASbGnctqjomU/0oF8DvKtndp4FxwW6C/k0DWqJ2fu5EGY4szAGquJ9JMvK4FXZQt5Jg
	K+O0LZ/D0G9AidYsXxunW4NpvPch7k7jIQAvUzM3HEJMF0lJVD+0YGV0MX2MzwBd+aSpbHVDRoW
	zSue67pQ3uzPMvJ8IWO5Lh3kCRNIkpt1Y0YQ9jCY2j9uw=
X-Google-Smtp-Source: AGHT+IGC0m4FXYYQm+k0AXFCSy3bx6F7/2cTaiKhBBnuAbB+6N8ybTZnHZCukOOueaHxtyfLbUpPRBURy2oO4IVfhl0=
X-Received: by 2002:a19:5f17:0:b0:553:ca33:46f with SMTP id
 2adb3069b0e04-553ca330808mr1234493e87.29.1750248554215; Wed, 18 Jun 2025
 05:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:09:03 +0200
X-Gm-Features: AX0GCFtzAwHH-ht5UUznh81aEY-DCCdnUYFURG79_8pBHXv4vb2M7QItIyT5tQE
Message-ID: <CACRpkdb3+uQ=PG+ne48hyvdTFeEQBxXtq3CwxpqEmd1m9o9fNA@mail.gmail.com>
Subject: Re: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts remaining pinctrl drivers that still use old APIs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
