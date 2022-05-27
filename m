Return-Path: <SRS0=hUq8=WD=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B0FC433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 09:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D995DC34118; Fri, 27 May 2022 09:00:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29C5DC34100
	for <soc@kernel.org>; Fri, 27 May 2022 09:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29C5DC34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id r204-20020a1c44d5000000b00397345f2c6fso120880wma.4
        for <soc@kernel.org>; Fri, 27 May 2022 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgOndPAfyvmijpJMBj3VbzHjuhYijVFfIUTkT6Spj0I=;
        b=yq2L9Iov93prcrerNONY8meYTbFWpiD9fleBq4FXsdIRRV8zY6ph1xHdNY/dzwUrcH
         vvxyR7HN6/UlVUj1cLMIpxlGYFf4UiDun28TCZzbHE7fNGH0BeuIipqNGnKNpqiAj1Mj
         DBtUJc1PrpN+1hs6oQMc1WoWyoCsE+ZOzGDMWBsXA7EO223rkpH9kKWQIn7gsB3q5h2C
         lAvbqAyNeosmQHZ0E7+ipm13Rfd8quSni+xiz9546V4eiDxUdj10O08iBeIaw+KXjHbP
         MwqfUHMwlumF0Hq84IIh5K4nhvndxXbYTxhG7szKBIBD0U82R5tnmIMQ0FwwZhB5RAb0
         H08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgOndPAfyvmijpJMBj3VbzHjuhYijVFfIUTkT6Spj0I=;
        b=mZBpKrqLbwaFY//UuEa1sLl7BfEvEOjvcQrdq3s8fMqznvqIl8UhLGzBDQ4qznsrbj
         wDvsfE6epQS5ilPWTGOAZer/w8Cb3Mq7MMMbIzMzebnYQm5id7ifiC8Yfv7dOY+p/0Fk
         odh8BmbVA0pdUWXnTXrQfFC1Fv3Ab9N6K/tBnk5R3axmJIEQf8qF45p8ld2C0Dz0uRoG
         2KiB0qD84a0M26veK9kgce8JmnqDP6Sy3hEBVKL4RYZ3bN7/wUVTyPhDZDKJvLnCJnMD
         IIFVpbtP+jocrWFTLx+c17b03tQPsPgo0cPM8TAzy/pwb26/UEA/KiAo2ccOjsCaDeiF
         P96w==
X-Gm-Message-State: AOAM533OOvIQ+6+85qB5JPXklxSkgXOys769JGm8XsP9I38a4XMsDC/J
	dnjTLHbnSDEPyXgV1j6pT2njvg==
X-Google-Smtp-Source: ABdhPJzkbMuzL2NSPBI/c7uo7e2MnvfNayThyWCQt8pFuNppY95EZcMlvC/RzIZPXwXVBZa2UnWCTQ==
X-Received: by 2002:a05:600c:1e85:b0:397:6bcb:c52c with SMTP id be5-20020a05600c1e8500b003976bcbc52cmr6042990wmb.41.1653642031059;
        Fri, 27 May 2022 02:00:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d6dac000000b0020feb9c44c2sm1347807wrs.20.2022.05.27.02.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 02:00:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	soc@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
Date: Fri, 27 May 2022 11:00:29 +0200
Message-Id: <165364202476.67525.12506050494553411270.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 26 May 2022 22:45:51 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/arm64)

[1/2] arm64: dts: amlogic: adjust whitespace around '='
      https://git.kernel.org/amlogic/c/7c928017461a740300ba0d74a5a4e7c09c8f75cd
[2/2] ARM: dts: meson: adjust whitespace around '='
      https://git.kernel.org/amlogic/c/5d08817f99847d0ccff65903a99794703de9ad46

These changes has been applied on the intermediate git tree [1].

The v5.20/arm64 branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil
