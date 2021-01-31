Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD10C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD3164E2A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD3164E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwA4G8ZeATr3VO+rAjI8cYPhDGBuKlkjogdV7a/2kOE=; b=pIUagFPQVWXNQ6KWoWB3ynyGs
	tcn9WKFg6Ld/VhpOhJkX66NCUh0OD3y4FoAXsWywtuw92kw+O1n3eGy5K9GTdJF3HQk3PNaegVqQP
	BaqKlrNQJQb61b1Qtx5DahA+yvH8NAIhVL2B7du9atsO2fpQBZ8VvWK2qcEWcO9xCfUmaId50lfQO
	L4EITxcqrTHSY4VRULuHoHMZo5dwDtA+sDU52/qQc0rB6PwyjoNLQ2Fi/I7D+omaVKeR2ovuDHRnG
	Btch0+i1aZZxGnIzN01fxRkIBS6/SiWYV+KwOUtupD3ik2QeACtraV//KtjFNyVavYsQLcUO/gqmW
	kAl4jon7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L33-0000zk-Hm; Sun, 31 Jan 2021 22:18:25 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2p-0000wq-9f
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id g15so9809594pjd.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azUrymzYkMpG3QdawuXg9B9eTIWCZ4nx4P4ZI0Sx6Pc=;
 b=Fi5Garo7fYRiZD2Gf5igCyIHildypmTMl3mHuRio4GC9o0hd8qRBrOVzTONiX17INl
 7GZVO/hHLpL8DgnGknCuEIetw2l9KPXgjFnoUuNU3VvwXRgMineCpnpAkXe/WrJ9h6dk
 1xUDVrdHJ00eBuTW5vk7Tcp1UMhNJf24JEkD5G3CSB0aftg3B4aX0Ul87Jiq4PxcUfPs
 IWoQCdjPJetYGiPvijEAi0KI8jtBpjiGRc52ciRUXg0HBCNTdBN3u0+OBwHYG4ElxT/9
 jnejqg893XLVixfLqEXgbkzSDAf6ZVe6XfKzuI9W0lcNNKwvV7HCkdix4K4UE4dgl7In
 +bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azUrymzYkMpG3QdawuXg9B9eTIWCZ4nx4P4ZI0Sx6Pc=;
 b=myAkDcCRarYThNvXra3AsgazhFu8A2QnI90wZAwesAUyXAQxGld1ANkmIEuabrPXj+
 1v3N4/qrLzzZERAJvGlRnQtxAFElblWWNDHhYnU0ZePV2hlc6FKb1TWm5ypLzWoIvgvQ
 eyqmR3u8/k9OPoT5DPQdTZzoDiIHEDZA98p92B58XeOt5ienPtJua6c16PEY1/X6RfjV
 ZnLjat2VkadGbolIF8tSlo7htimRWLJAflw7ANZoWzcLB00Z7JPnLPSYqzC04hk7G3qf
 59J1VX02cbh5WIir8FCwbTyvQ8UFGwZVEkb7edwepU2eiwKd/tuOOfWZnnrSrMxgMom0
 GJLQ==
X-Gm-Message-State: AOAM532BX8ULLpj38BR1PMnMiA8ihIdN/6RInIK877ZD9D4zmu/SfSS/
 66ZCtXVmbz7X3AJ5DAR0XsA=
X-Google-Smtp-Source: ABdhPJznS1Ur/1MiAJ+AKUoYzomujL9QNccE+rJLDi+mSPNdYXJpJCCxvwbgUdsr5E+dDCKsSvXrDA==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id
 o2-20020a1709026b02b02900dac6c0d650mr15206734plk.74.1612131489147; 
 Sun, 31 Jan 2021 14:18:09 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:08 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 5/6] Broadcom drivers changes for 5.12
Date: Sun, 31 Jan 2021 14:17:19 -0800
Message-ID: <20210131221721.685974-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171811_451130_7E330A66 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 olof@lixom.net, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221719.YBUvsJoAEAjFuOTRwWZYLc1cWepvYjY-7PLyXp4Wwek@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1YzhmZTU4M2NjZTU0MmFhMGI4NGFk
YzkzOWNlODUyOTNkZTM2ZTVlOgoKICBMaW51eCA1LjExLXJjMSAoMjAyMC0xMi0yNyAxNTozMDoy
MiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
Mi9kcml2ZXJzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOGI4ZjA5NWI5MDc2Y2E2
MTEwN2MwOTEwYzkyNzNhZmQxZGZhMWYwNDoKCiAgc29jOiBiY206IGJyY21zdGI6IFJlbW92ZSBz
b2NfaXNfYnJjbXN0YigpICgyMDIxLTAxLTI3IDA5OjM2OjQxIC0wODAwKQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUaGlz
IHB1bGwgcmVxdWVzdCBjb250YWlucyBCcm9hZGNvbSBTb0NzIGRyaXZlcnMgY2hhbmdlcyBmb3Ig
NS4xMiwKcGxlYXNlIHB1bGwgdGhlIGZvbGxvd2luZzoKCi0gUmFmYWwgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgUG93ZXIgTWFuYWdlbWVudCBCdXMgKFBNQikgd2hpY2ggaXMgdXNlZCBpbgogIGEgdmFy
aWV0eSBvZiBEU0wvQ2FibGUgbW9kZW0vU1RCIFNvQ3Mgd2l0aCBhIHByaW1hcnkgdGFyZ2V0IGJl
aW5nIHRoZQogIDQ5MDggV2ktRmkgU29DIGZyb20gdGhlIERTTCBvcmdhbml6YXRpb24uIEhlIGFs
c28gYWRkcyBlbXB0eSBzdHVicyB0bwogIGdldCB0aGUgY2hpcCBpZGVudGlmaWNhdGlvbiAoZmFt
aWx5IGFuZCByZXZpc2lvbikgdG8gcGVybWl0IHRoZQogIEJyb2FkY29tIFNUQiBVU0IgUEhZIGRy
aXZlciBmcm9tIGJlaW5nIGRlY291cGxlZCBmcm9tIEFSQ0hfQlJDTVNUQgoKLSBGbG9yaWFuIHJl
bW92ZXMgYW4gdW51c2VkIGZ1bmN0aW9uIGFuZCBpdHMgaGVhZGVyCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkZsb3JpYW4g
RmFpbmVsbGkgKDEpOgogICAgICBzb2M6IGJjbTogYnJjbXN0YjogUmVtb3ZlIHNvY19pc19icmNt
c3RiKCkKClJhZmHFgiBNacWCZWNraSAoMyk6CiAgICAgIGR0LWJpbmRpbmdzOiBwb3dlcjogZG9j
dW1lbnQgQnJvYWRjb20ncyBQTUIgYmluZGluZwogICAgICBzb2M6IGJjbTogYWRkIFBNIGRyaXZl
ciBmb3IgQnJvYWRjb20ncyBQTUIKICAgICAgc29jOiBiY206IGJyY21zdGI6IGFkZCBzdHVicyBm
b3IgZ2V0dGluZyBwbGF0Zm9ybSBJRHMKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9i
cmNtLGJjbS1wbWIueWFtbCAgICB8ICA1MCArKysrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL3NvYy9iY20vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9zb2MvYmNtL2Jj
bTYzeHgvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy9zb2MvYmNt
L2JjbTYzeHgvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9zb2Mv
YmNtL2JjbTYzeHgvYmNtLXBtYi5jICAgICAgICAgICAgICAgICAgfCAzMzMgKysrKysrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL3NvYy9iY20vYnJjbXN0Yi9jb21tb24uYyAgICAgICAgICAgICAg
ICAgICB8ICAxNyAtLQogaW5jbHVkZS9kdC1iaW5kaW5ncy9zb2MvYmNtLXBtYi5oICAgICAgICAg
ICAgICAgICAgfCAgMTEgKwogaW5jbHVkZS9saW51eC9zb2MvYnJjbXN0Yi9icmNtc3RiLmggICAg
ICAgICAgICAgICAgfCAgMTYgKwogaW5jbHVkZS9zb2MvYnJjbXN0Yi9jb21tb24uaCAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTIgLQogMTAgZmlsZXMgY2hhbmdlZCwgNDMxIGluc2VydGlvbnMo
KyksIDMwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wb3dlci9icmNtLGJjbS1wbWIueWFtbAogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvc29jL2JjbS9iY202M3h4L2JjbS1wbWIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvZHQtYmluZGluZ3Mvc29jL2JjbS1wbWIuaAogZGVsZXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvc29jL2JyY21zdGIvY29tbW9uLmgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
