Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105B336C582
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 07:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014009; cv=none; b=CP0zqW9njt08nr6OM2WeT3S9Rcyrv/Gwe9iXx8Eg6B574k+wCVV8PVl1u4jzb9BcUz0RSllveEmf4ixMOZAQPmszMcSgnDuisoh+sLoMv6DN+/SZXu0nJ08HzXAMFNZTF/4lOWK/ZWAQBbOF4qIaWrR496rfZjeOnC1Ch8ykank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014009; c=relaxed/simple;
	bh=TpxWNvuZBF/AXFXGdRoVS3Cna1SCwpFmFSpCgUaRWus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfyHl3/GGBDfKs5keZ00KYNVEAd3AzeX0KlWquVFER1+YhMti02kK6BFDzghmrSh3MCqbEHuEtpWzr4JhRXPlURtKV19hpGM9ySEsLH25oKIPmHsIBn+rw22Wf9t7O3YnUj63sF7Ry/m0kxqDp2hAP/eHhaEpW5Cp1zov1VNFIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CN9u3fR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CN9u3fR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36FAC2BCB5
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 07:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014008;
	bh=TpxWNvuZBF/AXFXGdRoVS3Cna1SCwpFmFSpCgUaRWus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CN9u3fR7Yp0EfDsHMVAxRfxsH5B6WA6Iar+8l9fO3A8yRKfDRsLvxXsVGyxLeRwsO
	 PASGGICj9VhJE0eudRV4EvurXWJVDlRZIGA4WKa4GdUrOr06p33c/9R12qdd/q6HDt
	 zQ+eyYbfn9F68Tt1XBavGTxPoROrin/g0A3vTfqzGw0r/hX5vqtCpLkS32plzVO2Cq
	 FmvKJpJo1LDhjj60Ex8IGTReJ8eQ7FonYiudIGiO98DcmJfOWvS/tAsfeTT4q8k3Qb
	 rouwBrQPg7wa41QzKrtBVQoHZPqTFFRYy6ZeFqwEgwGWf4/SS/Nn1l7DfVWo4r8xJB
	 KUL1HjFt5xavA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1307438ddso6833138e87.1
        for <soc@lists.linux.dev>; Fri, 24 Apr 2026 00:00:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lUnMMQHdtkcfMlcNDkIrR0VMcficLIgsW464Rlc6CcR2k9DRdNWrk+nog4xMESwlMwKc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/rAGvW4E4h+2MstpK06iM4YxY3B0jVKFGm1G/SoGA/rTeT489
	30/QQHkLBpP3xEAD3Mjpu7qBW2VMDaftX95Qr1xO8RFj/ubnLz2FbgZnGL8q/BshDDo6eGcUd2t
	GY6QoM72eK9L7yPTyrlRPVJi9kpzufsM=
X-Received: by 2002:ac2:5ecf:0:b0:5a4:1904:711c with SMTP id
 2adb3069b0e04-5a4190472a2mr5930173e87.29.1777014007583; Fri, 24 Apr 2026
 00:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-5-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-5-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:59:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnX8Mv=4uhwb8aJEhxDOxb=GUu+XKyzMt6YFR_oSzAo8A@mail.gmail.com>
X-Gm-Features: AQROBzCezkhG5rVZuAsLKRZJQW_-XQj075uRjGqqi5ZFtmzCA2vb_6WAeCT3IWY
Message-ID: <CAD++jLnX8Mv=4uhwb8aJEhxDOxb=GUu+XKyzMt6YFR_oSzAo8A@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
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

> QCOM_RPMH and QCOM_RPMHPD can be build only as modules when
> QCOM_COMMAND_DB is module itself.
>
> Fixes: 1c25ca9bb5c5 ("ARM: multi_v7_defconfig: enable more Qualcomm drive=
rs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
