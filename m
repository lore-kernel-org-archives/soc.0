Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A640DB52
	for <soc@lists.linux.dev>; Wed, 22 Jul 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764290; cv=none; b=T2Fm1MqdSb/IIoZspjN+ns4cj/+/IIdEKxKSRfE2gdMvpjI/Li1As47ptBkIAMh0QskdHdKrto7yK4F+5xrlW1aReiHAAky2Ca7b/Mfa2H6L3rzjP1BXon5jiL+whdis6ZaNDUcMc8fTzJyNGvI7szmdZOdZ9Up5NfsiCpEo+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764290; c=relaxed/simple;
	bh=l76vJB//fiv5NUToi24XYVgUjHJscXal8jTd8z2f55A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwadCIgpDmSoYDnjHAcC0npC7qP1w3q/O84n7q4+SSJp/xj2brET3az9Tf4UPC37yeS2+NZt0ep+y8K7jbQAD4sgESApVjEAxiNqpHftJNXk+xF0ctTXxVyyl4BGBmaZzhfMJf2jA91UQvMPRfNtBKRdBY1s0LR5lXjVDOYtFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JEbDosqk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JEbDosqk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc61541f8cso238855ad.0
        for <soc@lists.linux.dev>; Wed, 22 Jul 2026 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784764288; x=1785369088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=;
        b=JEbDosqkgaZ7J2CPORznBcBLFbJgusOOleqvSmn8u4zpICa/m9s9rrj2+w2AnZZZaS
         k2i1/Jc9SOT4HO/1wgIRFmEw66ehjnHnUtWYxmfbE/hfhftE3aL2b6WA+QqOMQh+BSQW
         6Ru7Z3F9T5bE6Zi3nRzvgC0maKICSp5Cfyk/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764288; x=1785369088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=;
        b=EaJQFWC4l1cKKqUKdtpaCaCFsTUkMosA+W232PIQGwwGJfyK0QgjdJj0qqpMks3yfb
         Mx65V1Bfzf3LNEH+fuH3k6L2mo7hKeGtLww51LpTja0Hpjlu5FXBdILfUmx8aHwXSrps
         hm3R5f1lwdfFnMqHuO1Gc8tM/6WKH1DBbkAVu29VeT5KolOAUUb2LMVCRojpShJjOtZF
         ydbBug/2mJXEiTKB73LhMxgH+/ebzvUh2LiLK/qsCk7CWbSLyIKQ+Wy6cPm6KCwAYWGv
         GIOBZXZuOpIhcB+yrKZTX0fP9i5rhhyhP4cF43FH0D59K2QMPged3yf75Ej/CnHvFaEp
         5X6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqnQsC7ruI3chBPoJUk/3QRAtfY/z0JhOTkiHtbbZ+Dm5ySzD0+eiKjChJJ23BHQhoFqdI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZK/A6MUz1m5LdawfWFFKT4BRKJSS4eMdvdbqDgBQiUIVOdzOc
	ZGUlmzBqHTueYh5YAsGH0M0+/xyJ8j4KgBSZ9/jKfJ4OLivpykv6iq5FsEjLPXDhPA==
X-Gm-Gg: AR+sD1219DHAvKWaj+1eUWg0k4U5J3g9f3NupGSgT58Qn9M7HLnJkqU3MT0Y2Ha3f6V
	X+auMQzfXa39Q8LhVL7Pb+1DZ0rET5s13NVVzg0LWtSTBq7KshpJ7Unap8e90O3avtaNVEgprPr
	k3EUbVxiXhtTW2QVdFahbPbfByc5riKhsfacd8W46FVF30zWaxTVrVvHPNN1pQi4KaFliiIkLTr
	ABRP+F1d2Se7XzIwgkcowf1tq/17ICCzsCKHgvI7s+xUmUa04U6HQDS8cxSnIHypYFDybFeM93y
	3uMBTjMP6XaVND6kUJxkWjPCcusTXRy5V7pCD+h9i4uOeyiEXb5IQSZ/FQ6wssfLvoYvFwARNLh
	cz+2dGMy7AoJZQIf8y6LIAlaifUuohzcHoFRIxjpNxL1FPUT4cvRPgynJfM4lJ63CaPAhS2AKx1
	H8vpmhOt+6NKd+pjN/Lv4sZF6mTgtpTjcN05xr4rQU9Wt+vKBiamc=
X-Received: by 2002:a05:6a20:6a26:b0:3c4:2f75:719 with SMTP id adf61e73a8af0-3c44cd1de09mr386413637.37.1784764288427;
        Wed, 22 Jul 2026 16:51:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:f3fd:a899:78ad:64d4])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3147e07000fsm25313445eec.21.2026.07.22.16.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 16:51:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:51:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>,
	William McVicker <willmcvicker@google.com>, kernel-team@android.com
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for
 frankel/blazer/mustang
Message-ID: <amFXfFFSGfqReFWO@google.com>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>

Hi Peter,

On Wed, Jul 22, 2026 at 10:55:55AM +0100, Peter Griffin wrote:
> diff --git a/arch/arm64/boot/dts/google/lga-pixel-common.dtsi b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi
> new file mode 100644
> index 000000000000..57c318ab44c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi

> +	aliases {
> +		serial0 = "/soc@0/serial@db62000";	/* &lsion_cli16_uart */
> +		ufs0 = "/ufs-placeholder";		/* &ufs - TODO "/soc@0/ufs@3c400000" */

I'm going to go out on a limb here and guess that these aliases are
being spelled literally (with comments pointing at their label) because
they used to be formed as overlays (where the label won't resolve
properly, I expect?).

Do we still want to spell it this way? This looks generally nicer, and
won't need an update when we get a real ufs node:

		serial0 = &lsion_cli16_uart;
		ufs0 = &ufs;

IMO, we can cross the overlay bridge when we come to it.

Brian

> +	};
