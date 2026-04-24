Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1993644DA
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013919; cv=none; b=BCbO8BIeo0olZUFAWAZRMZLrPaKD46Nho/DJ+X+G85zYUIj9jrecL8C5gM2rHlvDl4qLbNylI5oz9LHRsgwlA72wiAg5MjQTDRx9ewZN9Xe91xdASY8L31MSVJrubryvFJymNP6xCOGgJtCk+ONaQiRIrkFJBarP1gQhXK6uZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013919; c=relaxed/simple;
	bh=IPi/+Vyv6aQFQSyZXeZ0oxHNzEPss0vbDNKeN9Kde6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mI24gfTpjKSfk5kyQ0/XntTADdCDsdiMJrURa9eNA/fRzNnovALY/br4Yp2UUprG7J963GBVf1FNmBe3YUpswM6Hz7q9LB7NH+gYdVlzyfn8DfIeIMgdJ/FuVbfcauHn6WOmJNwD3zuRyRwc3kxCOQf/se+LWHwPMp6OvPOkPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kku4l+U0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kku4l+U0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0041EC2BCB5
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013919;
	bh=IPi/+Vyv6aQFQSyZXeZ0oxHNzEPss0vbDNKeN9Kde6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kku4l+U0ckoHtw89UyGWrNG9Tiq0DZBFD4DvNrjad0ByFYPh+LKqfkDEa9U9kMnUr
	 vq0p3R/4Lb3v5DPa5rmI9mbwoxss9YIHkWFr4lmE90eLwrPqVV65giT9hRpffQzraQ
	 allEsthfMW+RtefuYCK6sOV/BB4WxN9oBZVshceIPuLoh0nJdE5VYVCWeyD17JdPD/
	 QLA4y10kWgh3HRPwXtX+NYgx0z1ESnmR7sUI59VeurnBt2r0lXIO47rTt5V7N47lPM
	 yNvk/CsDkbXkmsgEHD9kN2g9ph/c4SB4sh8VphZ3l3+dKwzbILn5Ywovt/LvQ90Q92
	 oJIJd+F1qur8Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a10d130b37so7470321e87.0
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UPvRlxmNTMXCpwV8CN+jPeJ2u0aTLlhyVJZKwYXI9z4UDRrQHHWVsImZJ0B2mEWzoEvk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOdGxGIJ2fW2J0N/Apot83Wew3y76EmdJseQkSRgBajr5QuxIg
	oirp5nPqsvEeof998DlgNIQeWF3Q+Kr2YZ0vYCQnfcBwT7LQZfOCRmbB4pIVr+O0p++Tn/z6ZFm
	MSgniV+7pTPsiNWmSbbttZqvnKXDeDQs=
X-Received: by 2002:a05:6512:398a:b0:5a1:42ae:88b6 with SMTP id
 2adb3069b0e04-5a4172a2f31mr8641497e87.18.1777013917744; Thu, 23 Apr 2026
 23:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:58:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLnU6qf5QoW7xH+=0e4UiHWqUGQS5cX78EtEONhvxmLLwg@mail.gmail.com>
X-Gm-Features: AQROBzB-942dPXAfTM04NoAlrIm_VT2pS3PYsMqrPQZ0Mrmk0TIpj2V5E1vE8sQ
Message-ID: <CAD++jLnU6qf5QoW7xH+=0e4UiHWqUGQS5cX78EtEONhvxmLLwg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> I2C_DESIGNWARE_PLATFORM is default=3Dy via I2C_DESIGNWARE_CORE, which is
> enabled.  No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
