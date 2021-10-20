Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B69FC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFB560E9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CFB560E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zmb/8/ZYWkH2eW5pxqlc850jZb8tDAuLVGp5g7o0mLg=; b=O/qXcK0p4IL95q
	EccSCQXC+enZvh6fmsUAnpdwd6jEPXCISpJuaRGeMEsgCpnSy85U2IcSAHrXNikwL/KSYMuYDHx/N
	mC/nNxSdhpYnBOTEiRFodXj8cflvml8P5MjWXhvqo9S3cu/mc/iC4Bd5C7rcI4Rw5mMh9yHZbC/EZ
	iO+scpauJ8xlXWH7sJAgUBJ4t1D+N3NDrqWhTozolT9CPDnWyCiQo/SVPpc+Zt4Z++MhTkIYMTufP
	nXyLqjWxT2gVZrrub69gxPd4VqLkobo/7c9NtnClYTJYbQLNYxZ4e3XV0U557RQYSjo7vEI1KkB0m
	vimvlO4gD0zfaEx1N+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDJI-004whj-EU; Wed, 20 Oct 2021 15:15:21 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCxM-004qaI-I6
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:52:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id r19so15569394lfe.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uF9hWW3HRUf/pq/5JlaNIpHT0L4GbqCbpiYbDrZSHOA=;
 b=0rQGLB9YZvEkHvK2gZzkK/wXAshQ/85L4jcpnYTn/ZXKOUozcal+MHq8WwbHBllJ/n
 bBhmmBhdYW3pchY/eHmwbgkO+eCnMnP/yygJY6Vygqo9ypWELyqpAa/6esI4rE5QR97j
 k5k+RO5/XNlSP9bzowUY4wEmKd6fkztxB2AOq1MOoFLTE/yVe9rZe69DN1meqlbLLyEF
 8KvC2hK/OP/gWiHtVpZ4Kx97+PEKx9bpipD138oGEVd0cEadzRHZ4/yFG1cujSwWN6Ku
 tnJs3hCq2ImnBErlD9yQYGzg3GC/FBNBd6mO/i2yCZ5e6qiKKsNjyaAM6oTNHI4NqjJ2
 QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uF9hWW3HRUf/pq/5JlaNIpHT0L4GbqCbpiYbDrZSHOA=;
 b=44a3MNDDP9bfw9JtnCk99Yei5whZpRCE5DMNfoHIlyeVcIfAzSSf1gu/da8v7ugA2E
 uRxyX5Az3JrP4IsxP/pboj5WzefzA4mx+T496wQ+6g6H9duymceIHxOplHl28Y8GhzU1
 nXh5xMWIsL/gG5G8y3m6Ao4PzEdbypTXKvdEVXX/bwnnO5NiPO654b5CEAgmRbCSH5mX
 /7OVBkKgA/r5rvs+o3MApByNRljlj+LaUUsZvWGCndQizJq8zqwTe3hzgobqvSlSZBRd
 V7sCrfjyWZ7rSMu35EIma8JhW7Caa7eSTNNAcJvG7OPLVfUYFH0eB23SCjmOsrxyiXwn
 Zqyw==
X-Gm-Message-State: AOAM532XgXKcGmvRATHrdY+Zp4QULyL0J5f8n0kz8ScpWOPEiFcw8YJs
 bSl8XarCoE3SctDNWiuJhFKlS6pKRbOkRGYDh/GhTg==
X-Google-Smtp-Source: ABdhPJxpXDFarFNfEzRY7wsOM/9m/aFfKd6h5mqPvuRmjwEt9qei7dVsoAhUSKaOcnD8t59mJNjsNOJJ1O+LDQVLYbY=
X-Received: by 2002:a19:c201:: with SMTP id l1mr252650lfc.92.1634741557199;
 Wed, 20 Oct 2021 07:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211019141228.1271617-1-pan@semihalf.com>
 <20211019141228.1271617-2-pan@semihalf.com>
 <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
In-Reply-To: <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Wed, 20 Oct 2021 17:52:28 +0200
Message-ID: <CAF9_jYQt6ObUcaA0_aKHnQDoKuYPAYT48jfA3_RKE=q1OkCang@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] socfpga: dts: move arria10 aliases to
 socfpga_arria10.dtsi
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, upstream@semihalf.com, 
 Marcin Wojtas <mw@semihalf.com>, Jacek Majkowski <jam@semihalf.com>,
 Konrad Adamczyk <ka@semihalf.com>, 
 Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075240_693673_67A4F54F 
X-CRM114-Status: GOOD (  14.33  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020155228.gp6dEjxXJVPC7djAq0CPC0wVAJv0dCKRRtRl07rrHBE@z>

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMzozMyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDE5LCAyMDIxIGF0IDQ6MTIgUE0gUGF3ZcWCIEFu
aWtpZWwgPHBhbkBzZW1paGFsZi5jb20+IHdyb3RlOgo+ID4KPiA+IHNvY2ZwZ2FfYXJyaWExMF9z
b2Nkay5kdHNpIGRlY2xhcmVzIGFsaWFzZXMgd2hpY2ggd2lsbCBtb3N0IGxpa2VseQo+ID4gYmUg
dXNlZCBieSBvdGhlciBhcnJpYTEwIGJvYXJkcyBpbiB0aGUgZXhhY3Qgc2FtZSB3YXkuIG1vdmUg
dGhlc2UKPiA+IGFsaWFzZXMgdG8gdGhlIHBhcmVudCBmaWxlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgo+Cj4gTm8sIHBsZWFzZSBtb3Zl
IHRoZW0gaW50byB0aGUgLmR0cyBmaWxlcyBpbnN0ZWFkIGZvciBjb25zaXN0ZW5jeS4KPgo+IEVh
Y2ggYm9hcmQgbWF5IHVzZSBhIGRpZmZlcmVudCBzdWJzZXQgb2YgdGhlbSwgb3IgaGF2ZSB0aGVt
Cj4gbnVtYmVyZWQgZGlmZmVyZW50bHksIHNvIGtlZXAgaXQgb3V0IG9mIHRoZSAuZHRzaSBmaWxl
Lgo+Cj4gICAgICBBcm5kCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVtYXJrLiBUaGUgYWxpYXNlcyBw
ZXIgLmR0cyBmaWxlIHdlcmUgaW4gdGhlIHYzCnBhdGNoLCBob3dldmVyIHRoaXMgY2hhbmdlIHdh
cyBleHBsaWNpdGx5IHJlcXVlc3RlZC4gSSB3aWxsIGJyaW5nIHRoYXQKYmFjayBhbmQgcmVzdWJt
aXQuCgpUaGFua3MsIFBhd2XFgi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
