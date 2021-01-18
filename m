Return-Path: <SRS0=lYfA=GV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0256C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Jan 2021 18:10:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B0422CA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Jan 2021 18:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B0422CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hJao0p8C3olt5N8d3pdChep7cOE3JRhW0S5T/ScIBus=; b=26hwxbIloNhXxK/UKOS/p3y8c
	mR9WvgxBSITr/n3dKDf9MXom462Y6C6rAQHit6gRhuqWlocAA3RODKeVPiz3uzSi0weDmUxc10XPv
	uaBx4yLd25ko+qEGX1UnQbNC0HqDXWf8hbXiQdSQxcsqMDIfVKRGja/s940XMioc874lVaKka72jK
	HMwD2jXazC2hmam90tvTOnrUhgMUnZOhmYQ7DWjFSMBwLIZKSVH47b21t7BBGuxHDoVEQU/LWdkw+
	dWFK90yE9Xf3rHkPc2zORpA9fcTcWx4LVGR9iE9ywVSkqUzWzp0F3jGgTe0GIVUQqhKJIyyl4qZ1F
	xuZ8QsGlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Yxz-0006iI-Vv; Mon, 18 Jan 2021 18:09:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Yxw-0006gu-UJ
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Jan 2021 18:09:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id u14so10355587wmq.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 18 Jan 2021 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mKnu4Yy0ogp9EfG9YlOvCv8Tt32pBE+moBbd1rQQFc4=;
 b=OaplsSuJ7GorOCYPZNe5DPX8TAZXmYteYZDBa6YS62Kg+zrYO2Xn6ySD8vsEYmoGCG
 x6xhP8cTgAmg3FhgffFCFomalu4OKGqArtZfv62G5RQBZTZOnKREQ+6LWSJG0sXFQgCO
 H1kHXluj9pS0MhMmbuJJWkYEJZRZYJ/6eLrSoC5taeIbwAst80uKwYjaClHeBgB1/jyy
 uwpCIM+OjalWmJ0Fq5NN+y24A2wS5k4/dPxS87gI/ctvOZi4IK/YBtL81YRBwVxuApI2
 hINLgujbtPeGaIYdaLfU+94mHtxcIvyAQ4qd8PGiNYLH4ShCORAcp1QOzUCZSoDL4/CS
 BvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mKnu4Yy0ogp9EfG9YlOvCv8Tt32pBE+moBbd1rQQFc4=;
 b=UJmFXeYtYXL94RnxVE7hoCyZ6KejCPWHkLt8VJ3SVyo6uc88PvXVaD3iF6LIvV36Il
 4DaGn15FSlhUwCVihqC97DHxvJXrtoMEYc0Vo5gQhhPRdzuXiXeXCnwWy/ENZue1Xz7O
 vR9uqPMnXhxgVdOt5xMURK4dq8zyWtwMkFX7OhrGNT1myFDQB656izcrAi7W/fnwS51H
 0fINs7ri5chLyewAz1SjbGLBhThgroOs44Ej2X5fikhcgMWs/5qjvrxTBNrPd2N7/Wk+
 WliBB716xjWmq+zFY67VjICxUidZsllY+Fhp5SDOoMHUFwcLu96yaspGG9sXjbjMbKuR
 LH6w==
X-Gm-Message-State: AOAM530rytdFhrjaKb9uKyfVrj2sffNSJxqq/uKQ4DSl1yiY8RDo0hJM
 WCYXYE9xPrNCx9MZjRw0y6JYrQ==
X-Google-Smtp-Source: ABdhPJxebkVqMVQKgrO//bNnPR+mMA9bYV2CDqUfJUPEOcp6nAmWPboAQKoI0lqKm0WkNs5ootvLFA==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr525052wmf.151.1610993363227; 
 Mon, 18 Jan 2021 10:09:23 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:2095:8614:d69:136f?
 ([2a01:e34:ed2f:f020:2095:8614:d69:136f])
 by smtp.googlemail.com with ESMTPSA id b10sm259767wmj.2.2021.01.18.10.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 10:09:22 -0800 (PST)
Subject: Re: [PATCH v2 3/7] clocksource: Drop unused efm32 timer code
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <20210115155130.185010-4-u.kleine-koenig@pengutronix.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1fcd0b4d-583c-4602-69e0-31ca13b788fc@linaro.org>
Date: Mon, 18 Jan 2021 19:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115155130.185010-4-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_130925_051930_DF089791 
X-CRM114-Status: GOOD (  14.06  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210118180920.ddisSApgzh7yYZp_w5J6KJIZUqgHHp3B2bYBNGnczgo@z>

T24gMTUvMDEvMjAyMSAxNjo1MSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gU3VwcG9ydCBm
b3IgdGhpcyBtYWNoaW5lIHdhcyBqdXN0IHJlbW92ZWQsIHNvIGRyb3AgdGhlIG5vdyB1bnVzZWQg
dGltZXIKPiBjb2RlLCB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KCkkndmUgYXBwbGllZCB0aGlz
IHBhdGNoIGluIHRoZSBjbG9ja3NvdXJjZSB0cmVlLgoKVGhhbmtzCgogIC0tIERhbmllbAoKCi0t
IAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2su
Y29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFy
b29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
