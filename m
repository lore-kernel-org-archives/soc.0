Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F04D286413
	for <soc@lists.linux.dev>; Fri, 29 Aug 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462294; cv=none; b=mk35t0Gmws35Ci0VoZQryQAQl+qSURy6KpWSIe17kaTtw6A75VPOV03nAkqlHVeFpMn+WZV//EY2F/ndNBhy2Gq8/3YjH3D4+g9/HrifXlL5tTo1AE1PLgv2I3J2F4wbTjaxJKYHcHfr03cUd2+gqKNX3ONQYsquJ8IAv9huDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462294; c=relaxed/simple;
	bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1zuyyDRMhbi8dLomP8OBQ+NkFhzcVg8k9/RjElTjydZEHN8Q6ghGOXKGDRXFXrnsNI3GQrb234/rKIysk10inH8qNjCqRkB/PRtf5psfinLSP8phhJ2Cg9XyS/22ih1RxIklTwlxp0By4v2maIKz7+VrC+GxeYuuzVm2L/OVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+N1SKod; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+N1SKod"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-336b63d2e56so5457131fa.2
        for <soc@lists.linux.dev>; Fri, 29 Aug 2025 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756462290; x=1757067090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=R+N1SKod45LYrTOLiIdtvuE0S4OT+T5cZKvaFiTdmrUn9R4qYUMFYH+osEUWqzBx66
         IR8Rj6wMRzsXN9d9bInXL8Zj3bRky5VWSFk+yzJNokfGpZhNzV+IWywadHluhReYMhuS
         VsXfSWfrZXLwBzCQRAUpOEHuDzh13C1uIf+/jETl3CxDb/cBPoonAHicJ5YnUjYQX0qF
         swetWgtgbAAOnF8sgCXnIQXVBR7zDfR4jTAMl/W1KU5HmHI/VmXAeQoQJavlwqfT8n9j
         FzRY5Z9yHkomZ+2pDYwAgt6PKmHyfxh3kPWDOhk/d8NXNrBHpmUhSWJZYYJ6bzaC/8uK
         2GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462290; x=1757067090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=vBuB8kjGKVKALPwoS0v+FpVHPLDlgDmgFpR0PC+6LhTfEiqNl59orRDSOaUw8j8vix
         Y4bznWLcfkJ027E6kRbZBBRiDa8+hx+ybUbLB9d7bilaUfrw2aTo7OL7O1Z4ze01tX52
         0GgZehWW6yVuWbSfYwdP3YAIujcu04N9K7IU7n1QUtD/issNWYwtczb6V7B3XNrdQKt1
         bPX8A3o4OtsiYcrOS9PiuBndpt/RJCewf/HzvEB10/r41rrU3deNDxp4qoWLsK1K0OeP
         tPMsF+7knZSAmBI1QSK1A5E5s77eO51Z2VhArowKaOE1pQaX0kLA8bZfxITrgYU+RTwS
         7JKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAS6AvSVlIqSJUNRDmxQs6OYeUcnfawRCTeigiuLq2opt8a6WF9l7pbO1nDpTZsuf9ffo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIfpdQJ+9lc/keiYXfniSe8Lf0/eUg18Y5i/vr2HOf6w+Rl1Ej
	KWLrY4U04sf2kLrbCFI0puMyacQSnBrf0Sh6rRY+PnNS8lTKP0FQ+mntW64SUWOcFNW3xpsPxOY
	W6CGJ4RmtW1PFFWAAyT9eUpm7XGdAFcENo38X7J7Chw==
X-Gm-Gg: ASbGncul4EsSDbT4u54zznZk5rqUFHRJ9jeSr2em1DGN/VWb7THsW8Kimr8p+jTxL1x
	fFajdminDq5NXpLUAHDsGpzwXBHf2+JDtV04OuNT0Seubaa1pK1zXUs8RwidPE7swuXMD8L13/f
	5Czf3jh/BHJvumxjmQEOaP3V650QY7rNE9DSlKq7PscHHJSQGuofbfh8SQxQKoaeFtttoTscLGU
	JeppLY=
X-Google-Smtp-Source: AGHT+IF2rckuWDB0N8TfxkqBuz+CSPuYoKPwq0L/OKD+eFOshcmaXOwCLTHg9xCg7qGXInQk7y2zM1fsjZxdnfUASAE=
X-Received: by 2002:a05:651c:1544:b0:336:a8fb:937a with SMTP id
 38308e7fff4ca-336a8fb9b93mr12812201fa.19.1756462290440; Fri, 29 Aug 2025
 03:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
 <20250825114436.46882-1-ravi.patel@samsung.com> <20250825114436.46882-6-ravi.patel@samsung.com>
In-Reply-To: <20250825114436.46882-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Aug 2025 12:11:18 +0200
X-Gm-Features: Ac12FXxjnbVzeqW8L95iuuSr2TZOHM52rnOiOuvqvFvgSGHYE7jxXOy75cPjyPs
Message-ID: <CACRpkdZwz8C=MRgo1tQrkQzNtKMLV+P-LK8XyRA3eSFW-cbFCg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ravi / SeonGu,

thanks for your patch!

On Mon, Aug 25, 2025 at 2:07=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Please avoid CC to soc@kernel.org on these patches, they end up in the
patchwork for immediate merging for SoC:
https://patchwork.kernel.org/project/linux-soc/patch/20250825114436.46882-6=
-ravi.patel@samsung.com/

I think this is not you intention, the pinctrl portions will be merged by
Krzysztof who sends it to me once that part is finished reviewing.

Yours,
Linus Walleij
