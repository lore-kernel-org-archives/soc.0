Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C751F92E
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 23:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741993620; cv=none; b=gBAHOu9Yu9inMDXavVha/YkTlg+71FkHIAsA/qcv/xZJ139rXApfJxlNCjlADeshyB7s/D9MZMOT/7l5b0LA776fKCGwT1bCIu2rcGsht6mLHm1HkKkqAQthxsdCmzqi85lbQoXQJNSQMRcyLgPyhsOVnR4JwbvTPvvhjtY3YOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741993620; c=relaxed/simple;
	bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLMjIecI5QOe+qatK+/Ag83d0vUn+zKH1DES0bxpjU19O1zF79WhYoI4mYJJYgz9rMHRSbZBWadFWkasR4pWVRXXcOUtjB262AGdkpyUSz0OeZv9uiOqceRpiiFYca+47XAB47UOs02TVIdqDPsp80WZiLgnsCgqF01RlKLXcrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KrqbKcEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KrqbKcEy"
Received: by smtp.kernel.org (Postfix)
	id CE488C4CEEB; Fri, 14 Mar 2025 23:06:59 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E93AC4CEEC
	for <soc@kernel.org>; Fri, 14 Mar 2025 23:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E93AC4CEEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5497590ffbbso2724934e87.1
        for <soc@kernel.org>; Fri, 14 Mar 2025 16:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741993615; x=1742598415; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
        b=KrqbKcEyaLlRZJIx/UZZVx0OvafFbDcLr/BK6b7yMHc7JNY/I6WTNncTNVl8Bd2AXa
         AZp9qdiUdwldjq14IAZHDTJm6gGqgJx4cuI2LH59QzR+MWsbBGNzq2mloWfdz55GmsoI
         x8I6G+9NlI1AGTH1VJtPMeNbP6XFBbk7uYj9BORnxEp9OdvN9UPSS3uNMQUHU3VfLI2B
         XrmxvxshxyDkxnkD7Qc1q4eX1TS0ffn8HBvOkLIGekPrUo68HqVJ7vF9+oce/tX1JwDm
         Ic9shjbf4cxS/Z0K/EXJu+EkJ77GUPFEdDQiAU2hOGrr3tL3gCc/9X3x8cyz1LwJt30f
         NWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741993615; x=1742598415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
        b=iM9CN733vc2/ezh6WwgwpYDseBSTcTzb/Lqwu/0G5dacjTXrU1WU7yj0IAcxQJZrrl
         RuH9E/8X7a20z5XhBooiLPOS9+TFR8aiVPCku1HHsL8G+suEPqGsUrcMdS+y27hRzvmn
         qwleH0Bqbie1PNIdn4vyNMZ7A8ba4nYm+yq4ngYOXxneTtN60P6LdoJ60MwSVWkWKgun
         KC8sW30vb16bNl5GYZl5cKxpdDhFzOXqYkcn2b99zgJ/wLr1OsRGaSk3oT7ZDM8nOMpj
         PbkmKQsZswFB/FKOUAeZXGZL7QH5ftuD9LO0/trMrvvzdjphwhZCO70kI3dKryE78ef0
         lkVw==
X-Forwarded-Encrypted: i=1; AJvYcCXVvQ/19TehQ168y1fkYU5SHNlikdGhJVErfFpU9DtG3MLWBSixcTRFMKey2h8efBWyCP0=@kernel.org
X-Gm-Message-State: AOJu0YwpzkxJfyAac4xjLV6JfGxZ3TJJCmgGR4Te4uKhSkxNRV2r2knU
	QTkcPZgXF69sxdKpxZEwPtWj4mPD1HcihmXHMtXBCfRSf8i4BAeSYfPLBkVyV0Xf6ONNzALmbjt
	ywAPO/qqD6I3/FbFsz/iEZd2LzNv9AH4ovcr+4A==
X-Gm-Gg: ASbGncuxdxXT2FCGswS6EwpdLoSV5hWMPbmt3KPzhxSCx5zspkRrBQBDsOj5xJ1VaC/
	9tzW8+Lmc+0F3wrITlbLP4mvO7TgdGvczNKzsrtK3UmCQJj+VPUdpY/3vayd+ppA/x3dn3r8dfQ
	IIqHCZRvwx8Ge+I1/2aSVJ3+g=
X-Google-Smtp-Source: AGHT+IHuC1J1Yai2jxQeHMWFOi6OTmbD9XMUMWazPqqGxbglq+6gRZz39mX62xhHQPo6JQAFPJkP4DF+ZOLbOQK/cmQ=
X-Received: by 2002:a05:6512:b0e:b0:549:4f0e:8e28 with SMTP id
 2adb3069b0e04-549c39002d0mr1743882e87.15.1741993615226; Fri, 14 Mar 2025
 16:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
In-Reply-To: <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Mar 2025 00:06:44 +0100
X-Gm-Features: AQ5f1JreJjRROiVW-E27I_Wa53A3PnD8rRVkk2LLMQxZb6Qre-JjpCb6QRbcc7Q
Message-ID: <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 11:05=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:

> Are you actually doing incompatible changes here, or is this
> just about the DT binding?

If it's just the binding I guess we could do that stunt where we
apply the same patch independently to both trees and let git
sort it out.

Subject "dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC"

Sadly it's not the first patch in the series so you can't pull just that
from my tree.

Yours,
Linus Walleij
