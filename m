Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA61F03F2
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742455586; cv=none; b=ludLKyM9hYQXEgvuG2uU3etjbIAQhyMX4OodgJnLY4pQbq9JmfTLALD9FoXwrm80BQjKcWo5908/El5REOtmh6J+yGux0nRHRL8qJpV15NC125YJK45tay3vDxRjTnuefM/LPXyZjvE5LBfc/WPP++kHopnit24dqf3OA/uoy8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742455586; c=relaxed/simple;
	bh=g5RlrhwmM3WvmKofjVGTUhjSY5S5m5Xae1FzzM//IUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwyKltELcYK23zsM+RaXI2oto12c1SbOfeD/APViBZe7HMY1YkECuVErwr7kkwoV1ERkxS/6QXGf9YCkeDQ5VC0a312vjuKpiabGLgIMDqkdl9TS6fAhwQ4XZqWwpf50jv3HScZQkGu36LWDp4WtkqFapArErScIKZ/bGLPbtpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zqVCL60H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zqVCL60H"
Received: by smtp.kernel.org (Postfix)
	id EADB7C4CEE7; Thu, 20 Mar 2025 07:26:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB609C4CEED
	for <soc@kernel.org>; Thu, 20 Mar 2025 07:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB609C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so57636f8f.0
        for <soc@kernel.org>; Thu, 20 Mar 2025 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742455582; x=1743060382; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ND/9PBI/YCdvg4euUorct1cNUM5u3eXjAVZKzvHwQM=;
        b=zqVCL60HMO5YYURzbGPrEtMxZ+TT6A/47JJb08to6bTHYNJLa9H362h30YbWNTGC3h
         UWkgy8SJpW8o1wHNV7o9YAgXiMrZE8m0Ok1JMtxcrOHT4nW5maWz8X5ndM+iO6i4Ymrg
         zf4peM6cQgmlSYcQnQkivQEFf/OiwE0NDxo7Zi8gbNQdYXrw3i3bB1s0lv1RLFinTfC/
         zHXKR/H4pTtkxHmje+ixjekJ7R5FLOlcpta2u25hvLvJ3UHQo3odk06P35gHt+YqWI0V
         yW5HLgUho8vkyinnej8PZR4ZwxQB0sAoNRIDfCdJgQO0ukYwC2VcTfFgwtIlx/dQ6dp7
         54YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455582; x=1743060382;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ND/9PBI/YCdvg4euUorct1cNUM5u3eXjAVZKzvHwQM=;
        b=WI0TXueB8EHuOs+l2J8x49GUCA6JKFn5UpxaMqZtDmrHMpZaaOP5xuqVukCrj9J4GO
         A9u6UPqnEfrgmqWKsaDi1HSwkL3aXLI8xloSQoJl5J9uCVavGXbMPJjLkS3v3MMeWS0v
         KBe5N+MWzkFkeA0ZeC7r0vzyumg9F0cgkCO1lEL0Cya3yWebh0iAnJRFwultT5vo6v8v
         f/XvQ4rdyxJe43ATs3ebtw9PPlyIX8sbyaVQqnapKKQ7q9PGlzYH2zQsoZirg22Txaar
         vQ6RoN4n+je+fOankMppvorC0wenIGFw49i8i26MguorTi2M0z6DQ7Qcx3MHrpF1VXAf
         eeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcjuVhpbTqG7JhN3Sm0+EZFAClH8WDgzVUBWCwxgwQnvJmfjgKathC1KDcWlV3K/dLi+4=@kernel.org
X-Gm-Message-State: AOJu0YyLTO1fr1+fpQ8chMBRGeQX0Ct5h7a7yAXcCNfORfHnU3N3LXNN
	tBwjsbGeEecsfEvwhOcMfXjz7mFGvkf0Mu+L2piN19VeF/DJR868IMajZmhKJDM=
X-Gm-Gg: ASbGncuFaxxe5Ua6Db5JOz6QcRnKKCS+b/I5bl81zpYuGQOE2rMhLSH190v25pzng4j
	a0mCFNhemoWeVUy1T+mnKEvr3sP+NUf7IjmDFK/0sQzk+5csnDSGHHPfuN9dWt5ghGyA54EYHde
	RNDmx8/L6RcRMnHlAA4JsgOcGwF7FzCEt8PlcozpXkNMvQv50sutlvGDfsTKZ6p2yxnlnvhLWIs
	lJsifNRGpEGOS+RZ55GsOupNGq/2AuJG/avJo/r9AbaDGmtHgfN9amnu8gB4f8MaSDZkbRTi2dG
	P1pIo94sBDy7ZRzmgHMre0EqKAxbIP/Xs3bvI1gKnmLX71z+4y0fNgbtlHPsOeUjgjLoU2tF/Q=
	=
X-Google-Smtp-Source: AGHT+IGb95vY8nBsA1JEFRE5a+DX/wv5efFdVsN0XNBo8btgTlnU2mKcx2lqxAoydFeAQGEw8xmFGw==
X-Received: by 2002:a05:600c:1c88:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-43d46f6afbcmr16886635e9.7.1742455581881;
        Thu, 20 Mar 2025 00:26:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3978f185c6esm18862073f8f.94.2025.03.20.00.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:26:20 -0700 (PDT)
Message-ID: <e41292ab-3911-4031-bb91-ad458cdc5691@linaro.org>
Date: Thu, 20 Mar 2025 08:26:14 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 arm <arm@kernel.org>, soc@kernel.org,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>, Pengyu Luo <mitltlatltl@gmail.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Danila Tikhonov <danila@jiaxyga.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
 Nikita Travkin <nikita@trvn.ru>, Praveenkumar I <quic_ipkumar@quicinc.com>,
 Tingguo Cheng <quic_tingguoc@quicinc.com>,
 Cheng Jiang <quic_chejiang@quicinc.com>,
 Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Lijuan Gao
 <quic_lijuang@quicinc.com>, Luca Weiss <luca.weiss@fairphone.com>,
 Mark Kettenis <kettenis@openbsd.org>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Rakesh Kota <quic_kotarake@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Wojciech Slenska <wojciech.slenska@gmail.com>
References: <20250317215921.2031880-1-andersson@kernel.org>
 <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
 <fe56b19d-6ec0-4b0e-a47d-9e4dc8d798a5@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fe56b19d-6ec0-4b0e-a47d-9e4dc8d798a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2025 01:27, Jeff Johnson wrote:
> On 3/19/2025 2:10 PM, Arnd Bergmann wrote:
>> On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
>>>
>>> Krzysztof Kozlowski (17):
>>>       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
>>> sa8775p: add QCrypto nodes"
>>>       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
>>> qcs8300: add QCrypto nodes"
>>>       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
>>> qcom,ath12k-calibration-variant
>>>       arm64: dts: qcom: msm8998: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sc7180: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sdm845: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sm6115: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: qcm6490: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
>>> qcom,calibration-variant
>>
>> This seeems to remove the properties that the drivers expect
>> even in 6.14-rc7, so the branch is currently broken and I'll
>> skip it for 6.15. Let's see how we should handle this properly
>> in the next cycle, since it's too late now to fix it.
>>
>>       Arnd
>>
> 
> The driver changes are in wireless-next.
> +Johannes will you issue a wireless-next => net-next PR this week?
> 
> Seems like there should be a way to orchestrate these into v6.15.

It does not matter, it would not make history bisectable. Just like I
explained in this patchset, it should wait for next cycle.

Best regards,
Krzysztof
