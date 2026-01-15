Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA642BE05F
	for <soc@lists.linux.dev>; Thu, 15 Jan 2026 04:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768450306; cv=none; b=sfUxXDOuvz9nAuSAX1WEwT3NFuIplO/TS5QaqcOnJOv1ZjTfXyIUoyius5rNYAXIi9Qzgc1xpR9/Yr1Xp3Y9xsdgkt/tHGx6kTYBMDlVjobNyG1STktKnLdjgyG9bDPLcEkvFS3Mhc2ls4XjDRMsAOJWRP9EdXpw52c7amccXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768450306; c=relaxed/simple;
	bh=kkM52wtwVyVjW+QAm9LKFKkHw3APGb6+WhbcpmuFrq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdDIxJXaRz/4wGGdO8JgC7u7Ai7D1fmUqsFJwzn4y8cnZK8ZH9jw6dC8mgy+YKyUV7TdktMALB8HYxnSZrBqlGT9m6aNzf+S5EhHXvFV8+oz5AwBI6TKspvR1UHwokPOgDelauLGk8ouY4cVyCu67m4QwNluxy1aZbzX7WfoWNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qlNUhm89; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qlNUhm89"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81e7477828bso241261b3a.0
        for <soc@lists.linux.dev>; Wed, 14 Jan 2026 20:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768450304; x=1769055104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=;
        b=qlNUhm89fgrbiXN2sA1Bu9YgwAy5lUKq0mE47yZmGcCMiqgY+Yo6Vt8v7uPXSM4aMB
         fdfVAGE8m4/pwk92iBXWjwfRKgfCI7jsNrHAkARU6hTcfxUhCYsgq41rM7AVbzFRmjNs
         Y/C77KluLUnC5Cvy+2mtx139iwhS3TFpDyEVeibz0jHfSTUMeqOLZMMXnnRkR0Nbe5TR
         6IOKwC9lsRo4Z2sqdHue8bRuDi+XI+xgmSRdR7PUTyjytGBErqdCbn1huP7/0v1UwR2u
         V80rtIO+bHqyKO0dJaj0yOZZqq/TXUzvPWWSB8EjRkz9KeVb8bXg7Jo+/bxYSeTw4s1l
         beqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768450304; x=1769055104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=;
        b=ouVcdcXXgBCn2kA2ClGbBNiQRVGVG7XIfSxT1T5StiKb3Uf992YS1BXssvov9Y82aw
         8lhcNXYbVpjyAD1ssIfvrm79AjTw9GTMwa8DCD9RpN4EI1pU24MG1pQ8eVk7NcO6FkZh
         EKDp7RZFh1qFwY7EEP3b04IRcGiFMLasA+qdiLwTK+9NRglMvdYmzleyjDjwYAKwvDM/
         7zDLcgdxAuweFhb7SItUKUwBGTZM8TI7luXpmxjkz+NEJtR6rrV6IdJoXW8Rilx6IDX2
         3OkpVRJjxT56Y97hT7ts40BGiAfMFkhHiopGqtLdBEfPR5kEbJc3f4T6+Zd/ltRnIhhU
         ripw==
X-Forwarded-Encrypted: i=1; AJvYcCXzePTAtCwD8N/iQFrvrk9AZ80OOXk6X5+MxF34ETO/6jbuBk6EcDgqrowOv9Dzq9+br68=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwhrr9H5sxjqf+QgD3UZbNrMGpGUZOk8Mo+Rt0I1+LHFOEsgxT
	gBz7f/kHfv+GgdkkD4J6n4vIJLBE82OEcQcgQceKRTO9iOCJDaepwvZGf8DNDzmqtTs=
X-Gm-Gg: AY/fxX7b9YvC4r/diOMmiSg+JPGVGSgoLRS0i95c3p5wustJUuFgKzL3cvVaw/JFn/h
	XBtMIrJSb4wbauo6FmUWE4u94BkmF/Mp60l11dd5ARZz9Oi2n81Dwo1EKNuXTXVrfwG1+8yyeEd
	4IdWeXEhKA5FzN2fVHbgQkjvrvgDGtcBuCpJKNbxnk/cuBsrnogcTSteuhMRv8XQVyuDn6bcbkh
	cx12mtIiCpyGCtDytG54LSfUdqNavYudyAlmIAgay2Sc3ScMvwVvaXrsPrI6rLGZz+gJ6UJNhXb
	1lgoMV/xMW7IwmBZVPiW1aakeGZAyxlYScjSCFei36VF15s5ySCBRR+DAOy9/hw3ct528mklE9U
	rnOweLkBDG3vyuBtb0st/6dl+Sl/unGJUD8n6gBRxwfKa7tWuusJXz1ctG1tWy1k1tR63KaNLIz
	3sdcC2bXFC+hw=
X-Received: by 2002:a05:6a00:886:b0:81f:413e:5b6c with SMTP id d2e1a72fcca58-81f8efaca14mr1910211b3a.5.1768450304213;
        Wed, 14 Jan 2026 20:11:44 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f19c5sm1038158b3a.23.2026.01.14.20.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:11:43 -0800 (PST)
Date: Thu, 15 Jan 2026 09:41:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] arm/arm64: dts: st: Drop unused .dtsi
Message-ID: <idqqwx3svrauv3e26dce4uofevcyd3a6lltsjvpeovp6nse4le@yqym3jc25xr2>
References: <20260113201340.36950-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113201340.36950-1-robh@kernel.org>

On 13-01-26, 14:13, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Drop erroneous QCom .dtsi
> ---
>  arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
