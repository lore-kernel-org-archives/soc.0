Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18A442119
	for <soc@lists.linux.dev>; Mon,  6 Jul 2026 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333399; cv=none; b=q9GJLBergJ9tOx0N/ucdjLMqKCyN93HnmMaANG+N88RM+ZLJ7Dgiy7XwO3hAOwrQMXZhUOJuB8YJcv0ikRR8rrnNfOlIsl6qdeLZQ5fmzMLbsURyNV0dB+eEESx89VoTPTVTednHc/MptN2/sk9Dy160YElXlVON5IimYr1UcUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333399; c=relaxed/simple;
	bh=Iqy3tyoDUG5thE5lCg9oMEFEo35/Eoz6TYzbbn1DjHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gELRl/B2VGG3dldAomLBvnnhY/e401jEIDVyD2gQAyoIXHmGCbcMZMky2YG9sUdejSJrGykgZg81VLUCXvxuaP99G9xiprTIA9HgB5DYFbbpgrS49DYcD2BUjlEpk39spKn18ibx4FovKSmpTIWzLAV3dvtrcxHTUxoz/xfUz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPcodLj+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPcodLj+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so45691055ad.2
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783333398; x=1783938198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EL79Y50FRAVxmnnlJsIkErdepD3FvDl+N7VCboCkaKM=;
        b=TPcodLj+sp7mPtJSXHmVQAnI0E7pNVqp951p7Z3B6HPbjvoO4kmlG1LH6/33A/fQk9
         7wQPaxpu0Y7v2PNcWsYoBk/42sHR2XWRdRNLw/pkIG9Jnf9fzmTqs+MzSZXDJehIBQuB
         +a2giLpK+SmvCObBpjTqnTqV64LhFRAwEKFDLH2iN6330tAx6ElE1+v0YbTuysKHhBYT
         ERZGdTSMsUcHCsZkoBHza69Jg4JTB4wMNYHGxpvkhdEWJFd8LHplz+53aQ5IWntrF4oT
         xTJqdBMAERGDXrqK8Z/f47MYUnMVoRAAuoiGzJ+4xralJKnC17iZ30iL2pZcnONU2+0T
         vNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333398; x=1783938198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL79Y50FRAVxmnnlJsIkErdepD3FvDl+N7VCboCkaKM=;
        b=Su01FG3sAKDa7RJtAfMRb2XF/J57S0cQN9EYKdEKjJFL+7GRLTlxw3ogf/SZYJj/kV
         XnNRFfhOw1d9Rk56f9htPu5SP9fq4GfVajlqIMXTwUAMlf1/GK5E8MAlizunWcOBq3em
         brZUGTASRlKO269wBKoS0n8eaNTMUCqZScWrTtMvLokgJ2qPw5L2IYIQ8dajM+E60tFN
         JnouXGnWU8iECW2cnG2eKqYXEi66gCIi8N58FntT5vwXg4KROSYNeMriRapYx0UmhfDe
         RVTSX4QTobCLri/41mcr4Kmz+SAboOlGujX3+7gBCcIioFqphIhQ1AJYOJhBwo9Pbiql
         HywA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ2IpT3Mix6/EKkul9RwKRj2Wz9L6PIpIGrDPYp+pIsODaJ3cJ7Q2rWO5sH2eJ5tjWri4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiQmQ/GgWxF0JVujaps7rNeJqgShq1w6D+3L4CaI33ghN1zDu+
	Idz2L7t/SIRXds0mt0q3lqL8s/vr7ayFlg5PebgCuZDYpnnqHmSw/jPF6XaUSsz2jpk=
X-Gm-Gg: AfdE7cmBviPibmqt5+4W5eYpKO166jzBqXIQwuLOXSeXyxPrbGtjX+IbSn6l04PKW5Z
	ZJM2G8wsB6fI5VpjSw5aETR/ukLDcumr2SGz08pS1a7K5lVOIs0ELp1whhzD85xzGFSLE8mxWsM
	IXtOsiTCfZZkSEipd6MmPbPuc1IxDkHKoijRv/W3uwf0UvGIUmAn4BwrBkOb+qD58K+igt8JphM
	on8IesbnWzNigMs6eyvUQ5YaqK7eslqWKdabwWZze2h7TtuEbJQUNseDrwGwq9cwkApQ21vFNeG
	ohzhVvn7aEPG3qLHiXdo4AN6Nq2+MKWnidJHRInBDKmnqacSC/iV+o7cF+tDpHihuxh8+IZHPLC
	2H1Uu6UvfofV9zCsYSx3ioHuEQCHgXFJkFwTWw/ljUNZev/VicrOHxcfUI07qw//t+yFMiL53MN
	3S6NcJVaCTotQDuueMwQk+a5A=
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr89665045ad.3.1783333397781;
        Mon, 06 Jul 2026 03:23:17 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm61161044c88.8.2026.07.06.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:23:16 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:53:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: st: spear: Correct indentation
Message-ID: <gbafvant4c4cw5gw5pxrwpjjueroj557i2dor3p53z3jodqimz@cbiztajpiex3>
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>

On 06-07-26, 12:18, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear320.dtsi     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
