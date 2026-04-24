Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577B35F162
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013580; cv=none; b=BVBtuT56IzWeiRYHqkzTREZEyNwsOSC+H5P+6VyYUHyoPU2F/JLV/ragT/p4u+srX9t9pEBH2uDx3bHurmouEmXWTH3xSkRTT4ytUt9YAXC2u+nh+7RrJ4tw7WzvBs5xHOd+DGTZ/begny0e9oNlLc1Q7G7SWwlO2PTI8Yv415o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013580; c=relaxed/simple;
	bh=gNbMg9AslVvZiiEWGI6uGT+vEhOUt52xGI3Fc3qxq8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRZH0zQeHkXYNkgdX8Y79+jhlpkNbA2P8vig/uhoYX6G3bCdOL9J8tcGh6km5ANlrwIlgu3Iqo1HZzxtSdtym1IFBFIM/uC/VNlfjJZX7H4hAu3hu+rRuNRZraybE3/VQhtyC3v+NyK2IfU1doG0fKhsJrTOFwqNsnHDXbsiNjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTXK1Ak7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTXK1Ak7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678F1C2BCB8
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013580;
	bh=gNbMg9AslVvZiiEWGI6uGT+vEhOUt52xGI3Fc3qxq8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JTXK1Ak76tCGFWb7vMniYbyq48DWii1+RRGlO2wpvHGVtEwu+GHK6qPRR/JR43xDJ
	 vciN28Hl4jKw1KkBnhwlwO6S40W7KZuAA8XFeQ58hfxnzCAa2xulzagF34iX24r40p
	 CXFMSnpG2L5N8KK8kWRpjtx8Q7WxxAnhxVMZFxbruCPqmFG4TV3rcq/LUxo4z/RhGo
	 JVhJDpY3ooIl3JpsK4uvUbobtIbS6fLwWX/GFgtYnUYeDP3lgzzJOqNxik61gGtTLF
	 vZYJzgxks1Wo7Arfqcl+Re7FkJfmH+gackc2aue4fNtMf3a+QfJHCfLVXzDOkaoyhm
	 8bxZtuQW3ZFBA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so10494837e87.1
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:53:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+3YOF779wl3Fwg5jVNMfdq+Rrpb7vsgzVBPISjJ/evoPqvZUa63j18kLoj4LjW3hDgZUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhOo3RWTKLsX2Y1GAYgzyrpFwBDkni6qKWy7ezb4Vu5bs/qmf3
	WP1sjrou0q239ynKsUJCbLGXHuAty/MoAZILuysX5Tb3LZEa+K5DADRGGLIY6myKFfDUUfW1plK
	KNbABRDwj8snbTyJkSeOyaOqmGs/rhdg=
X-Received: by 2002:a05:6512:1447:10b0:5a4:194c:d897 with SMTP id
 2adb3069b0e04-5a4194cd8bamr7403618e87.12.1777013578918; Thu, 23 Apr 2026
 23:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-3-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-3-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:52:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=CwN95oU9bfhi_NmbCqn58rok2vLZg5sG4owUcvAfKQ@mail.gmail.com>
X-Gm-Features: AQROBzDCv_DrToTiZDyzTe7ZjtHhnunM9aws4kiPnrnL6FeGj5zRRLPjXVxCHtM
Message-ID: <CAD++jLk=CwN95oU9bfhi_NmbCqn58rok2vLZg5sG4owUcvAfKQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: defconfig: Drop default or selected drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Drop all options which are either defaults or selected by other drivers:
> 1. IMX Pinctrl drivers are defaults for this ARCH.
> 2. RP1 is selected by MISC_RP1.
> 3. I2C_DESIGNWARE_PLATFORM is default with I2C_DESIGNWARE_CORE.
> 4. DRM_SAMSUNG_DSIM is selected by DRM_EXYNOS_DSI.
> 5. SUN6I, SUN8I and Renesas DRM drivers have defaults.
> 6. SND_SOC_ROCKCHIP does not exist.
> 7. Several ASoC drivers are selected by other main sound switches.
> 8. USB_CDNS3_IMX is default with USB_CDNS3.
> 9. IPQ_APSS_5018 never existed.
>
> No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
