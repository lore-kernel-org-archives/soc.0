Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1C7C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 19:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A769D60F9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 19:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A769D60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYMy/9QdJygN8hYNxOgXrpYD5DtB6uXhIQuaTMh76mg=; b=aqddXLJPPT4+Zw
	MBuJqriRYZXg95ubUVX3+KjTOnBT95tIK4QYbYXEjr6fyzvwrterJ9KWrKmX7G2FYr2rrUATnomDx
	m1VykrZ8dyVkt97a6rXqPFTBNODAS552rhY+R5Ggn4nPmiGWCpXDImCoPSc0VcQrozaMmgaBSZG4u
	TJHIroFMnuuRDI8A5AZAghkXoosRIwM2VYZq9SG8iuFeSClymeXqOJ6kk0xZkkXAKR/jrvXMvY192
	xtTGog1WSXH966wrmh4vNVRk60cTmpoPEyUQKpHcGc0U9mpcq8oiS0Q2h1EQpyt+PfFIaQeUel10s
	9EgSkuyIaNhPeotRC5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYvCI-003vt4-Cd; Fri, 08 Oct 2021 19:06:22 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYvCE-003vsa-5B
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 19:06:19 +0000
Received: by mail-qk1-x72c.google.com with SMTP id ay35so1687712qkb.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+PFG95vsWGuyHt4PcF9O/qQQtXb2/roNae5ZiPerc+I=;
 b=Vg84jUhZ066KbwPCq09KSWKk5BMC/nESlSL+LvmOsd9WOTqV4fVqB6I1sVrBLn+BEY
 Lr4BmXiMbxhqGcrcd6KQBJY9t78dmrCJ4nL4AtiEg6etmi8+yWMScE37Qar+/wVHsDAP
 yB04phzc7eYq7KCmvPVMKkcgnl9G99lu63U74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+PFG95vsWGuyHt4PcF9O/qQQtXb2/roNae5ZiPerc+I=;
 b=wRWcv35ez8+pn7Wipz/kujXRIxwkSh/V4gBplVnMJrF6ZqEfDw7XiwTPYKX5aB7Hag
 xIHOXyy3tZkiNP8U25BAusymwg1CGNFMnrRMeLwGN3vnRYNGozubRSHaHYYXfXsX9Z9R
 xYf0e6g7YhvSbY58CTIBXnbVPB8aFjlGGylncXgxcGdT/hsSagp7x6nj9+9rn6v8JUfE
 mgawGnGIB78RBQ8SvbHr77QiVLUev4SHoEIj9YcwrlCqa8Du02RlHC5Ar+SeqCFl0t6U
 VF1A81fQmFPw0VJGzPw7/mgTn2FB4ncNKG4mdBUpr5XpQ8g4GAPFWzDgFJdsE4gcbxH6
 z3sQ==
X-Gm-Message-State: AOAM532anZF0FFPzpeLNuE1ikio85BOLu+7brKbNMKfWm3UL6NdNC45j
 XvkZK7E41+rA+TldxmZjg4TBN6/2iMG5jw==
X-Google-Smtp-Source: ABdhPJxrnyUbTsJvzEungNwf2vbkMbm/oIihkBg7IIHTsJPukBl30Px4z66FJq5SwypFxGKPxsuioA==
X-Received: by 2002:ae9:eb48:: with SMTP id b69mr4502488qkg.453.1633719975687; 
 Fri, 08 Oct 2021 12:06:15 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id o21sm116437qtt.12.2021.10.08.12.06.15
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 12:06:15 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id z5so23279594ybj.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 12:06:15 -0700 (PDT)
X-Received: by 2002:a25:db91:: with SMTP id g139mr5128084ybf.391.1633719553275; 
 Fri, 08 Oct 2021 11:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211008140735.3290892-1-pan@semihalf.com>
 <20211008140735.3290892-2-pan@semihalf.com>
In-Reply-To: <20211008140735.3290892-2-pan@semihalf.com>
From: Alexandru M Stan <amstan@chromium.org>
Date: Fri, 8 Oct 2021 11:58:37 -0700
X-Gmail-Original-Message-ID: <CAHNYxRxuj_p-+zHCO9iEK3H7QrBAPy1Cx0tCh3ufRqYnK124qQ@mail.gmail.com>
Message-ID: <CAHNYxRxuj_p-+zHCO9iEK3H7QrBAPy1Cx0tCh3ufRqYnK124qQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Rob Herring <robh+dt@kernel.org>, dinguyen@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, upstream@semihalf.com, 
 Marcin Wojtas <mw@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>,
 Tomasz Nowicki <tn@semihalf.com>, 
 Jacek Majkowski <jam@semihalf.com>, Joanna Brozek <jbrozek@antmicro.com>, 
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>, 
 Maciej Mikunda <mmikunda@antmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_120618_231192_D3C1F40F 
X-CRM114-Status: GOOD (  20.26  )
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
Message-ID: <20211008185837.Bmk8SbPMaszQYoL26-n2M5_5cO3reBi1TXygT-kqZuc@z>

T24gRnJpLCBPY3QgOCwgMjAyMSBhdCA3OjA4IEFNIFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhh
bGYuY29tPiB3cm90ZToKPgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgTWVyY3VyeSsgQUExIG1vZHVs
ZSBmb3IgQXJyaWEgMTAgU29DIEZQR0EuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQW5pa2ll
bCA8cGFuQHNlbWloYWxmLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJv
emVrQGFudG1pY3JvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJpdXN6IEdsZWJvY2tpIDxtZ2xl
Ym9ja2lAYW50bWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBHb3JvY2hvd2lrIDx0
Z29yb2Nob3dpa0BhbnRtaWNyby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEg
PG1taWt1bmRhQGFudG1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgLi4uL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJy
aWExMF9tZXJjdXJ5X2FhMS5kdHMgIHwgMTEyICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDExMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmls
ZQo+IGluZGV4IDdlMDkzNDE4MDcyNC4uMGE3ODA5ZWIzNzk1IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL01ha2VmaWxlCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUK
PiBAQCAtMTA3OCw2ICsxMDc4LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfSU5URUxfU09DRlBHQSkg
Kz0gXAo+ICAgICAgICAgc29jZnBnYV9hcnJpYTEwX3NvY2RrX25hbmQuZHRiIFwKPiAgICAgICAg
IHNvY2ZwZ2FfYXJyaWExMF9zb2Nka19xc3BpLmR0YiBcCj4gICAgICAgICBzb2NmcGdhX2Fycmlh
MTBfc29jZGtfc2RtbWMuZHRiIFwKPiArICAgICAgIHNvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2Fh
MS5kdGIgXAo+ICAgICAgICAgc29jZnBnYV9jeWNsb25lNV9jaGFtZWxlb245Ni5kdGIgXAo+ICAg
ICAgICAgc29jZnBnYV9jeWNsb25lNV9tY3ZldmsuZHRiIFwKPiAgICAgICAgIHNvY2ZwZ2FfY3lj
bG9uZTVfc29jZGsuZHRiIFwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc29jZnBn
YV9hcnJpYTEwX21lcmN1cnlfYWExLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJy
aWExMF9tZXJjdXJ5X2FhMS5kdHMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMmEzMzY0YjI2MzYxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMKPiBAQCAtMCwwICsxLDExMiBA
QAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvZHRzLXYxLzsKPiAr
Cj4gKyNpbmNsdWRlICJzb2NmcGdhX2FycmlhMTAuZHRzaSIKPiArCj4gKy8gewo+ICsKPiArICAg
ICAgIG1vZGVsID0gIkVuY2x1c3RyYSBNZXJjdXJ5IEFBMSI7Cj4gKyAgICAgICBjb21wYXRpYmxl
ID0gImFsdHIsc29jZnBnYS1hcnJpYTEwIiwgImFsdHIsc29jZnBnYSI7Cj4gKwo+ICsgICAgICAg
YWxpYXNlcyB7Cj4gKyAgICAgICAgICAgICAgIGV0aGVybmV0MCA9ICZnbWFjMDsKPiArICAgICAg
ICAgICAgICAgc2VyaWFsMSA9ICZ1YXJ0MTsKPiArICAgICAgICAgICAgICAgaTJjMCA9ICZpMmMw
Owo+ICsgICAgICAgICAgICAgICBpMmMxID0gJmkyYzE7CgpZZWFoLCB0aGlzIGlzIGZpbmUgbm93
LiBJIHN0aWxsIHdvdWxkIGhhdmUgYWRkZWQgdGhpcyBpbgoic29jZnBnYV9hcnJpYTEwLmR0c2ki
IGluc3RlYWQuIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBldmVyIGEgY2FzZQp3aGVyZSB0aGVzZSBh
bGlhc2VzIHdvdWxkbid0IGJlIHdhbnRlZCBmb3IgYW55IHVzZXIgb2YgdGhpcyBjaGlwLgoKPiAr
ICAgICAgIH07Cj4gKwo+ICsgICAgICAgbWVtb3J5QDAgewo+ICsgICAgICAgICAgICAgICBuYW1l
ID0gIm1lbW9yeSI7Cj4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4g
KyAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg4MDAwMDAwMD47IC8qIDJHQiAqLwo+ICsgICAg
ICAgfTsKPiArCj4gKyAgICAgICBjaG9zZW4gewo+ICsgICAgICAgICAgICAgICBzdGRvdXQtcGF0
aCA9ICJzZXJpYWwxOjExNTIwMG44IjsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmZWNjbWdy
IHsKPiArICAgICAgIHNkbW1jYS1lY2NAZmY4YzJjMDAgewo+ICsgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImFsdHIsc29jZnBnYS1zZG1tYy1lY2MiOwo+ICsgICAgICAgICAgICAgICByZWcg
PSA8MHhmZjhjMmMwMCAweDQwMD47Cj4gKyAgICAgICAgICAgICAgIGFsdHIsZWNjLXBhcmVudCA9
IDwmbW1jPjsKPiArICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxNSBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw0NyBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwxNiBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw0OCBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmZ21hYzAgewo+ICsgICAgICAgcGh5
LW1vZGUgPSAicmdtaWkiOwo+ICsgICAgICAgcGh5LWFkZHIgPSA8MHhmZmZmZmZmZj47IC8qIHBy
b2JlIGZvciBwaHkgYWRkciAqLwo+ICsKPiArICAgICAgIG1heC1mcmFtZS1zaXplID0gPDM4MDA+
Owo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICsKPiArICAgICAgIHBoeS1oYW5kbGUgPSA8
JnBoeTM+Owo+ICsKPiArICAgICAgIG1kaW8gewo+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsKPiArICAgICAgICAgICAg
ICAgcGh5MzogZXRoZXJuZXQtcGh5QDMgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHR4ZDAt
c2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHhk
MS1za2V3LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICB0
eGQyLXNrZXctcHMgPSA8MD47IC8qIC00MjBwcyAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHR4ZDMtc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICovCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcnhkMC1za2V3LXBzID0gPDQyMD47IC8qIDBwcyAqLwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJ4ZDEtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8KPiArICAgICAgICAgICAgICAgICAg
ICAgICByeGQyLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcnhkMy1za2V3LXBzID0gPDQyMD47IC8qIDBwcyAqLwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHR4ZW4tc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICovCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdHhjLXNrZXctcHMgPSA8MTg2MD47IC8qIDk2MHBzICovCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcnhkdi1za2V3LXBzID0gPDQyMD47IC8qIDBwcyAqLwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJ4Yy1za2V3LXBzID0gPDE2ODA+OyAvKiA3ODBwcyAqLwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwzPjsKPiArICAgICAgICAgICAgICAgfTsKPiArICAgICAg
IH07Cj4gK307Cj4gKwo+ICsmZ3BpbzAgewo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9
Owo+ICsKPiArJmdwaW8xIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4g
KyZncGlvMiB7Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmaTJjMSB7
Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICBpc2wxMjAyMjogaXNsMTIwMjJA
NmYgewo+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiaXNpbCxpc2wxMjAyMiI7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IDww
eDZmPjsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsvKiBGb2xsb3dpbmcgbWFwcGluZ3MgYXJl
IHRha2VuIGZyb20gYXJyaWExMCBzb2NkayBkdHMgKi8KPiArJm1tYyB7Cj4gKyAgICAgICBzdGF0
dXMgPSAib2theSI7Cj4gKyAgICAgICBjYXAtc2QtaGlnaHNwZWVkOwo+ICsgICAgICAgYnJva2Vu
LWNkOwo+ICsgICAgICAgYnVzLXdpZHRoID0gPDQ+Owo+ICt9Owo+ICsKPiArJm9zYzEgewo+ICsg
ICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDMzMzMwMDAwPjsKPiArfTsKPiArCj4gKyZ1YXJ0MSB7
Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmdXNiMCB7Cj4gKyAgICAg
ICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICBkcl9tb2RlID0gImhvc3QiOwo+ICt9Owo+IC0t
Cj4gMi4yNS4xCj4KCkhlbGxvIFBhd2XFgiwKVGhhbmsgeW91IGZvciByZXNwaW5uaW5nLgoKVGhp
cyBsb29rcyBnb29kIGFzIGEgYmFzZSB0byBtYWtlIHRoZSBib2FyZHMgYmUgYWJsZSB0byBib290
LiBJJ2QgYmUKaGFwcHkgaWYgaXQgbGFuZHMgKGV2ZW4gdGhlIHYzIHBhdGNoKS4KSnVzdCBhIHNt
YWxsIG5pdCBhYm91dCB0aGUgbG9jYXRpb24gb2YgdGhlIGFsaWFzZXMuCgpSZXZpZXdlZC1ieTog
QWxleGFuZHJ1IE0gU3RhbiA8YW1zdGFuQGNocm9taXVtLm9yZz4KClRoYW5rcywKQWxleGFuZHJ1
IFN0YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
