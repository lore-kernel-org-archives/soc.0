Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7EA277003
	for <soc@lists.linux.dev>; Fri, 29 Aug 2025 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459584; cv=none; b=q/FPUV9BVDiiGPhwYKe+VnwCGgYnbErEq54AjpEDqi0jt1579twwokFPPILbhATCzNKPT1WibAboB6krz4nuENzxF7H/e6j5ZKISKulQ5Q+sY2h2LaeqePFV4JcQYecZqIZ1OSf5sVr8yHlpQj9jyY3oGBFJV5RQv4AFVCUNAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459584; c=relaxed/simple;
	bh=uYsAQkNL9FlDnhB0WAk0oZ0SRFbXvinmzWx0htGozcQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=iXMt435KPocC0WCqhu+Hq8Rbr//1OBGfrP3xFwQbvRsvALENfLXbTIpdPRpM2C7Hout8naRFiGT81h53yjOCC1lbEoSdeQtP7HKKVZUfJvO/p/LJLfokhbPSUE6b1BJ4PPvU4S1dDD64Y7htJMfcko/6+TIMBlrc2yFv9EAtK2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOD5OtWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOD5OtWs"
Received: by smtp.kernel.org (Postfix)
	id C14ABC4CEF4; Fri, 29 Aug 2025 09:26:22 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C068CC4CEF0
	for <soc@kernel.org>; Fri, 29 Aug 2025 09:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C068CC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3367144d19cso17066671fa.2
        for <soc@kernel.org>; Fri, 29 Aug 2025 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756459579; x=1757064379; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9O6/n2KCZah3+n6ZdMwuaNRQX5T9KrxQ3HhsaEAylUY=;
        b=TOD5OtWswNCO942fWOb57QPdW0SIFqYpBNxGV8ljx3KP0i9srnSNoQl5+zC2veQDfX
         K5R++zIH6nAUVZNTjgEI5TpuiYbRI7clK8aecxcoQu7o06bENca6jbtFITPMiHpuvk/2
         i6/F3oaht4EaTppnAvVoLEivZxz8WBBDFm7wCYv2FeFtOGVmlRe67YiwULli3PHOi2YH
         3QDBnVZ37Fwx5JvgYjeD+WGliY1mFdQnKV8PR3DxINYwZhMEkViv7pSnnVaNKaXbLIiw
         5MJG9+w1pPnEEqiKk473tRIMc/NJi5RlsLUjPMXlPynfkKl+6nOqVIScOLhhH3BXrypb
         rlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756459579; x=1757064379;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9O6/n2KCZah3+n6ZdMwuaNRQX5T9KrxQ3HhsaEAylUY=;
        b=WiDB2VUc+JKATbnVletLL76TsZWBZvNsFipSnEyQ+bsf0kM+8VR5sUHH9MT03mCBbc
         najMVoqn9H9euk1828r1+50UmZxfLn+rmI3fG6h57DU8jRGsM5Pba8xWBGmH3wqaYJxZ
         wWj3e+487WZ0Yp2G+S1ONSxwbFaP/LMsOv+mAv75Ed0n9DjwXVn4V7lMR2eyYBEkLFIg
         xvNu7In3AIUT7Ca1q4PkPQSDY4/Ct7kZG6nN7snkn9tI13ATG89uNAzFmmL/HqQr4TnR
         M79IeofbsGOreddl8lLo+5M4NgyntVSjOvCZn4L/J2pUuAsSqyTcIGQUTecaW7+QT0sw
         2Tsw==
X-Gm-Message-State: AOJu0YzxEKsOQeQUgJpWpRnTXhWjxQYxLP9EZWWah24yL1GPAj5W3ZAS
	CAuEnrIcmlRLheHN8KygI69wJuFP74FZPObg2i6uwCtIiGyv3qZsbEtbgCBHdaAumY5uJcIY2pb
	bGAaZbSO/lXrmmM3iotgh9fPwpbq3SdIb6TPL0aozmLCRIaHn+Yl/L8w=
X-Gm-Gg: ASbGncudPFOQwbxYJF5VsGNAhx9/Pxtu3PNFxd4tbe/ojlMC2k63C7XxslPp0zLmbCE
	rXR977GJ642/0zIQoWGzbKFqRBA3w0SEV1f1thSnNC6iu7NBIDl5XWaz195xFz1KXLdzcLoG/EZ
	UM/ZmW//Mzq4xXex57UeLnaLD8dyogotsmLqVN6wD6hbRuejjP9NwT9Rio0LqYWibQ7ZRkn5hdj
	AdHeAD2vYOALnQfnA==
X-Google-Smtp-Source: AGHT+IG2Y/yvinXG3SveXVTS3E4dOcqRyzaP5pP1vCw3YCfBefM9vtg00uC7kbMlsPRTk0S/XI+T7CjFpTkr1xe+Ipc=
X-Received: by 2002:a2e:a990:0:b0:336:80e3:b15e with SMTP id
 38308e7fff4ca-33680e3c715mr33252411fa.14.1756459578832; Fri, 29 Aug 2025
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Aug 2025 11:26:07 +0200
X-Gm-Features: Ac12FXz5AhVWqTqfSCc-_ezjIR0S-3TDTGfQoqqCuB3znbSZAu9_qlMQEko1w4Q
Message-ID: <CACRpkdZoDCXgsTGzUUWABbp_r1Xjv7vp7_NjEnEWzMmDQG+UJQ@mail.gmail.com>
Subject: [GIT PULL] IXP4xx device tree updates for v6.18
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these are some new DTS stuff for the IXP4xx, it builds
on bindings merged into the networking and GPIO git
trees, look at the signed tag for more details.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ixp4xx-dts-v6.18

for you to fetch changes up to 85ac6b806993200fe117f4fd047c74784ec6b515:

  ARM: dts: Add ixp4xx Actiontec MI424WR device trees (2025-08-29
11:18:15 +0200)

----------------------------------------------------------------
IXP4xx DTS updates for v6.18:

Add the Actiontec router MI424WR A/C and D device trees.

Prerequisite DT bindings have been merged in networking and
GPIO git trees:
https://lore.kernel.org/netdev/175106401649.2079310.16035106613106076029.git-patchwork-notify@kernel.org/
https://lore.kernel.org/linux-gpio/175614780274.8817.4717113656972710108.b4-ty@linaro.org/

----------------------------------------------------------------
Linus Walleij (3):
      dt-bindings: Add Actiontec vendor prefix
      dt-bindings: arm: ixp4xx: List actiontec devices
      ARM: dts: Add ixp4xx Actiontec MI424WR device trees

 .../devicetree/bindings/arm/intel-ixp4xx.yaml      |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/intel/ixp/Makefile               |   2 +
 .../ixp/intel-ixp42x-actiontec-mi424wr-ac.dts      |  37 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts |  38 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 272 +++++++++++++++++++++
 6 files changed, 353 insertions(+)
 create mode 100644
arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
 create mode 100644
arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
 create mode 100644
arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
