Return-Path: <SRS0=r9yq=WU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141FEC433EF
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 17:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB122C341C4; Mon, 13 Jun 2022 17:55:52 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AEC2C34114;
	Mon, 13 Jun 2022 17:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2AEC2C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id l192so2450884qke.13;
        Mon, 13 Jun 2022 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1Pc6hRYC4rxtooxyM7/YSQoCVphSsBsKYzZCiGbgBwo=;
        b=NHedRiTOluSlKdlkfloHbszUpNhcsUAob4OQWchXPrS15ln7j81SEaRx0j82fIhGS2
         BB3B7mPS9wILuicHE4AwhdoKIf5TkbEkeStrcQ7JNQ1+eyXeDGqIleGe6N+ShB1/WvpL
         TxqdkIBcJfkjeajA01l4484kk3K6bxW5bwU+WvQLB1mSX12yKcO7zh8qwG4sQ4G5JGx9
         hF6hKEroFguQBgV3o4d0BY25fmhHSEVz9JZrL/WfkVfPi0zRdfaeFHb5UC1lkOGteEPu
         A01+pgg7zzXCyiaUDXTrEbvtIqTrXfxSEoAERt9SO7YUmLMDOYNKcO2iY5yi54tqjxw5
         aFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Pc6hRYC4rxtooxyM7/YSQoCVphSsBsKYzZCiGbgBwo=;
        b=Ep8IuVHSKPaSWx5V+OWXpjcBxG76iC2ZAms0FZ+v9LKqmXn4axxjKGbuysmjF5yguE
         eNq+gioej2miMYjGuvDzepJhWC1RcjzMhhtgeZKqTfPL7Cy1lfrX9sTbwGFn5J8pxefN
         es6vCon7CA7+gpJfVHset7Mp2aVawQ1J0GzOpFtdiUeIcLbRLCMB116Z825B6Lv/MUBv
         CWy4nFz0M1srlicAJJuiUWpL0J4ei0ygy0UDlwoh6hVyz8OKevghKAYVW7FIzUno6Pcc
         Dh0Lf+L0/V/s+f5Ib+eBHvbmYS844quw08PTqKQpAl0fxFeKgwoYTXdyLtVjAwGRuq3G
         gETw==
X-Gm-Message-State: AOAM531hvXQdMObORZx2+EXwXq+5EZDAJmlhO3v6gu02x7oEj2KGPo7t
	Ll3qv7UBTn8LR7s+DvGym/lEujlNWw0=
X-Google-Smtp-Source: ABdhPJyQlPebYQo8foZhKRh7sqp7VBuXiVEpt3Q7DGxRzs+fqeIulnUb+A7p+UEUAl9zsgK8dDMq0A==
X-Received: by 2002:a05:620a:24d4:b0:6a7:1d74:d8e6 with SMTP id m20-20020a05620a24d400b006a71d74d8e6mr915132qkn.379.1655142950966;
        Mon, 13 Jun 2022 10:55:50 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006a785ba0c25sm4437788qki.77.2022.06.13.10.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:55:50 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/48] ARM: dts: broadcom: correct gpio-keys properties
Date: Mon, 13 Jun 2022 10:55:47 -0700
Message-Id: <20220613175547.245095-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609113938.380466-3-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113938.380466-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  9 Jun 2022 13:39:31 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> gpio-keys children do not use unit addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
