Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2E1DF242
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995746; cv=none; b=Dw4C9be7Q2EjNnSqwADXVNzKeOYapWTLeDFtOGmGfT7RkoerEfymSfOCnFvRG7rmFXlIN+N+0EAJIsgTSQQjKE9h6f2UF+QQ+kwdaPF+RqF2lDMrMiTg1Nyqz0pdzERbpIesvJnXfmeBhkzHuF/jBSyK6AmXUEx7uCxVhApLgkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995746; c=relaxed/simple;
	bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgU6ybL8AhD70EPVe8e3q5BdVez9gmsu+trIFW+bTFiRm7gOBPChmkw0G+YStHXZ6eX1TWXzCErygH+aItAb12GsgxP9zwFe6XgCO6Bb5CcwOFK6oKutuJYmWAYN401/gKABRzACX4lotF7OpfRSdPWMj2PV5m+Ixo4VjwOPfaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjuKCPM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjuKCPM8"
Received: by smtp.kernel.org (Postfix)
	id D03CAC4CEED; Fri, 14 Mar 2025 23:42:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C21DAC4CEEC
	for <soc@kernel.org>; Fri, 14 Mar 2025 23:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C21DAC4CEEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-543d8badc30so3071831e87.0
        for <soc@kernel.org>; Fri, 14 Mar 2025 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995743; x=1742600543; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
        b=JjuKCPM8GIE51o6Q99msztwPYIhW6DMRapPn7Wub8uHvsAcumn/WC2m40ZEqfftY0t
         Q9PjpJddMSPhxCC8Y45zhO4yE3qTKhmssLlg6NXPMlEyKMxjwnkJDXwf5azzV7Z+qcFF
         ek/sczM8/Dc/4LfD8NSxIpxXTuvSZHkhWqdxByGx6/DsUI8dk1kEL4s5i2/U0n+whOyu
         ZUyogkrI0jN/n848toptIPEZGjTnEzg5pej5tSV7iBoF70jRtaNZ/wzhEkO5aVWfiuA3
         hl0zKkINOHc3U14UUxtbywv8jCT0FQ8pawsQZvoWO6APnTRjhSdalhiwfA/H1Rjg6qqt
         /mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995743; x=1742600543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
        b=Snh1qPzgWgjfpwA72f6rgy+saiO9XH52UEZSr5EWk/jLO54iJLjcRLocoHwKdpclZL
         IYVRvcdnpy43qEyE6+xvHR6id4OqaWpImqQ4ZXdD+cmWNkmL85tnMF8cUGb+Ak2bLmKy
         vxQwcgqU9gTQ8xlryH7umSKW1fyafuBb92wwX62iafEaG2Ch4agSKyWtpS98FiKtjVxG
         lIolGZjwoglGE6/XQ8AoFitN3AabLxPtVXul5hSZnJTQgnFZbxEtB3gtm1hx0nm607xX
         yLBIkaoifedBKonS73GFhsJ8RN+kdicoSQtqrTiwrF2g9FNe1URSnuQh7Z/Qu584s/xO
         b2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2zkJrDoyQ6dBvitMGIXqZe5CFg7+NEvqAgBFXhTQA8dAA5B7Ep91yaS/IDmPiJ0uSoic=@kernel.org
X-Gm-Message-State: AOJu0YwM9kz3CLOYhqxS9WsvptrOO5pFDhxVJyM0KjRjYA9eizCy6uYV
	qqm6FxDVddcexxsK2ABp/3DjtQLrn8mXtjSnVSJLv3IRq2o7IgRQq0KYccfMYyVyZrcIFVn3oYk
	dVQsHodHmGZLh9DhlHit4APRe+mYy7DWHTyNCRw==
X-Gm-Gg: ASbGncsVBY9MVjxPUVkh0eT17USAvQjeVgKY2KhkzCa+iRvKlrFmZvHPIpg/so2lP2Y
	2o9oKL0cSpP2+mgyaa2sAMGegriRFxf93V9+GE27QcqkCywDrk+mZa+VUF6lJL8Zk+4pNNe8hSq
	/tsXg0tynLa2+rIqv4PRjMe/s=
X-Google-Smtp-Source: AGHT+IH2XrsL8yYl1YnEw5KjXw8pQrBhLhYCrdne0HwB7XZwvtkUckarOcWg0mzevQ8o+qQ4EgbgVcAmMqOmghDeBpo=
X-Received: by 2002:a05:6512:39c3:b0:545:d72:95e5 with SMTP id
 2adb3069b0e04-549c38f58e0mr1469764e87.7.1741995742834; Fri, 14 Mar 2025
 16:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com> <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
In-Reply-To: <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Mar 2025 00:42:12 +0100
X-Gm-Features: AQ5f1Jpu-cIvAEmPOEuCazdHtSeZTHJaPnNt4nIJ_esAuZFz_4ZvByvCeSjIFs4
Message-ID: <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 12:20=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com=
> wrote:

> I guess this means we should checkout the binding patch in Linus's tree
> and merge it without other driver patch? Or just take the binding patch
> from the patch serie and let the git ignore the same thing?

Either way works, it will not have the same hash so it will appear twice
in the history but it will be textually identical and git will sort it out.

Yours,
Linus Walleij
